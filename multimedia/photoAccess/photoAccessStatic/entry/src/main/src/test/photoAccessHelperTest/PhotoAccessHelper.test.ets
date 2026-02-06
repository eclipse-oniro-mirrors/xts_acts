/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
 
 import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Hypium,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Context from "application.Context";
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { sleep, Constant } from './Common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import common from '@ohos.app.ability.common';
import { getPermission, driveFn } from '../Common.test.ets';
import hilog from '@ohos.hilog';

let domain: int= 0x0000;
let tag: string = 'testTag';
let phAccessHelper: photoAccessHelper.PhotoAccessHelper | null = null;
let predicates: dataSharePredicates.DataSharePredicates | null = null;

export default function photoAccessHelperTest() {
  describe('PhotoAccessHelperTest', () => {
    beforeAll(async () => {
      let testContext: Context = Hypium.get('context') as Context;
      console.info("getContext", testContext);
      phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      predicates = new dataSharePredicates.DataSharePredicates();
      await getPermission();
      await driveFn();
      await sleep(1000);
    })

    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100
     * @tc.desc   test getAssets operation: fetchOption的fetchColumns为空情况下，查询一个已经存在的照片对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates!
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300
     * @tc.desc   test getAssets operation: fetchOption的fetchColumns为空情况下，查询一个已经存在的照片对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates!
          };
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        } catch (err) {
          console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500
     * @tc.desc   test getAssets operation: fetchOption的displayName正常情况下，查询一个已经存在的照片对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['screenshot_20240805_124506.jpeg'],
            predicates: predicates!
          };
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.ARGS_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0600
     * @tc.desc   test getAssets operation: fetchOption的displayName不正常情况下（displayName不带后缀），查询一个照片对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['screenshot_20240805_124506'],
            predicates: predicates!
          };
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.ARGS_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0900
     * @tc.desc   test getAssets operation: fetchColumns is ['uri'、'media_type'、'subtype'、'display_name']，查询一个照片对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['uri', 'media_type', 'subtype', 'display_name'],
            predicates: predicates!
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions, (err, fetchResult) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1000
     * @tc.desc   test createAsset operation: 创建照片，type:IMAGE,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          }
          let uri: string = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1200
     * @tc.desc   test createAsset operation: 创建照片，type:IMAGE,extension:123,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = '123';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          }
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.PARAM_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1300
     * @tc.desc   test createAsset operation: 创建照片，type:IMAGE,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'a'.repeat(4097);
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          }
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.ARGS_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1400
     * @tc.desc   test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：title为undefined, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => { //14
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          let options: photoAccessHelper.CreateOptions = {
            title: undefined
          }
          let uri: string = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          console.info('createAsset uri' + uri);
          expect(uri).not().assertNull();
          done();
        } catch (err) {
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1600
     * @tc.desc   test createAsset operation:创建视频，type:VIDEO,extension:mp4,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => { //16
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          }
          let uri: string = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          expect(uri).not().assertNull();
          done();
        } catch (err) {
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1800
     * @tc.desc   test createAsset operation:创建视频，type：VIDEO，extension：123，createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = '123';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          }
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.PARAM_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1900
     * @tc.desc   test createAsset operation:创建视频，type:VIDEO,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = '';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          }
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.PARAM_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2000
     * @tc.desc   test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：title为undefined, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          let options: photoAccessHelper.CreateOptions = {
            title: undefined
          }
          let uri: string = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options);
          expect(uri).not().assertNull();
          done();
        } catch (err) {
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2200
     * @tc.desc   test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          let uri: string = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension);
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2300
     * @tc.desc   test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          let uri: string = await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension);
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


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2400
     * @tc.desc   test createAsset operation: 创建照片，type:IMAGE,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err: BusinessError | null, uri) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2600
     * @tc.desc   test createAsset operation: 创建照片，type:IMAGE,extension:123,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = '123';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err: BusinessError | null, uri) => {
            expect(string(err?.code)).assertDeepEquals(Constant.PARAM_EORRCODE);
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect(string(err.code)).assertDeepEquals(Constant.PARAM_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2800
     * @tc.desc   test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：title为undefined, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          let options: photoAccessHelper.CreateOptions = {
            title: undefined
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err, uri) => {
            expect(uri).not().assertNull();
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          console.error(`createAsset1 failed, error: ${err.code}, ${err.message}`);
          expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3000
     * @tc.desc   test createAsset operation:创建视频，type:VIDEO,extension:mp4,createOptions：title为testNum, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testNum'
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err, uri) => {
            expect(uri).not().assertNull();
            done();
          });
        } catch (err) {
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3400
     * @tc.desc   test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：title为undefined, PhotoSubtype为default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          let options: photoAccessHelper.CreateOptions = {
            title: undefined
          };
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, options, (err, uri) => {
            expect(uri).not().assertNull();
            done();
          });
        } catch (err) {
          console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3600
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3600
     * @tc.desc   test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = 'jpg';
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, (err, uri) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3700
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3700
     * @tc.desc   test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = 'mp4';
          (phAccessHelper as photoAccessHelper.PhotoAccessHelper).createAsset(photoType, extension, (err, uri) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3800
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3800
     * @tc.desc   test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(带album_name,fetchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info('getAlbumsDemo');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions).then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        }).catch((err: Error) => {
          console.error(`getAlbumsPromise failed with err: ${err.name}, ${err.message}`);
          expect().assertFail();
          done();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3900
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3900
     * @tc.desc   test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(不带album_name,fetchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC)
          .then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
            expect(fetchResult).not().assertUndefined();
            expect(fetchResult).not().assertNull();
            done();
          })
          .catch((err: Error) => {
            console.error(`getAlbumsPromise failed with err: ${err.name}, ${err.message}`);
            expect().assertFail();
            done();
          });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4000
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4000
     * @tc.desc   test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(带album_name,fetchOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info('getAlbumsDemo');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions).then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        }).catch((err: Error) => {
          console.error(`getAlbumsPromise failed with err: ${err.name}, ${err.message}`);
          expect().assertFail();
          done();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4100
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4100
     * @tc.desc   test getAlbums operation: 通过albumType.USER和fetchOptions指定album_name获取指定的用户相册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info('getAlbumsDemo');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions).then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        }).catch((err: Error) => {
          console.error(`getAlbumsPromise failed with err: ${err.name}, ${err.message}`);
          expect().assertFail();
          done();
        });
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4400
     * @tc.number SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4400
     * @tc.desc   test getAlbums operation: 通过fetchOptions指定三个用户相册的albumName,并按照album_name降序的情况下，查询对应相册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_STATIC_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        console.info('getAlbumsDemo');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'newAlbumName');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions).then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
          done();
        }).catch((err: Error) => {
          console.error(`getAlbumsPromise failed with err: ${err.name}, ${err.message}`);
          expect().assertFail();
          done();
        });
      })
  })
}