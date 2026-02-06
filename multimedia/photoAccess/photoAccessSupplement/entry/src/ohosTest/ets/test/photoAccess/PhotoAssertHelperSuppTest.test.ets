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
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium'
import { driveFn, getPermission, sleep } from '../common'
import common from '@ohos.app.ability.common'
import { JSON } from '@kit.ArkTS';
import { dataSharePredicates } from '@kit.ArkData';

let TAG = 'xts.PhotoAssertHelperSuppTest';

export default function PhotoAssertHelperSuppTest() {
  describe('PhotoAssertHelperSuppTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      AppStorage.setOrCreate<number>('testNumber', 1);
      AppStorage.setOrCreate<string>('testString', 'test');
      AppStorage.setOrCreate<number[]>('testArray', [-1, 0, 1]);
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    afterAll(async () => {
      AppStorage.delete('testNumber');
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00001
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00001
     * @tc.desc     PhotoAsset get the first parameter is ""
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00001'
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.get('');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000014);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00002
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00002
     * @tc.desc     PhotoAsset get the first parameter is null
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00002'
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.get(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00003
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00003
     * @tc.desc     PhotoAsset get the first parameter is undefined
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00003'
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.get(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00004
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00004
     * @tc.desc     PhotoAsset get Invalid argument
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00004'
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.get(AppStorage.get('testNumber') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);;
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00005
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00005
     * @tc.desc     PhotoAsset get Invalid argument
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00005'
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.get(AppStorage.get('testString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000014);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00006
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00006
     * @tc.desc     PhotoAsset get Invalid argument
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSERT_TEST_00006'
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.get(AppStorage.get('testArray') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00001
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00001
     * @tc.desc     PhotoAsset set the first parameter is ""
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00001'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.set('', 'newTitle');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000014);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00002
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00002
     * @tc.desc     PhotoAsset set the first parameter is null
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00002'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.set(null, 'newTitle');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00003
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00003
     * @tc.desc     PhotoAsset set the first parameter is undefined
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00003'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.set(undefined, 'newTitle');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00004
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00004
     * @tc.desc     PhotoAsset set the second parameter is ""
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00004'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, "");
        let result = photoAsset.get(title);
        expect(result == "").assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00005
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00005
     * @tc.desc     PhotoAsset set the second parameter is null
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00005'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00006
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00006
     * @tc.desc     PhotoAsset set the second parameter is undefined
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00006'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00007
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00007
     * @tc.desc     PhotoAsset set the first parameter min length
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00007'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.set('a', '1');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000014);;
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00008
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00008
     * @tc.desc     PhotoAsset set the first parameter max length
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00008';
      const MAX_TITLE_LENGTH = 255;
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const longTitle = 'A'.repeat(MAX_TITLE_LENGTH);
        photoAsset.set(longTitle, longTitle);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000014);;
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00009
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00009
     * @tc.desc     PhotoAsset set the first parameter max length + 1
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00009';
      const MAX_TITLE_LENGTH = 256;
      const MAX_TITLE_LENGTHS = 255;
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const longTitle = 'A'.repeat(MAX_TITLE_LENGTH);
        const longTitles = 'A'.repeat(MAX_TITLE_LENGTHS);
        photoAsset.set(longTitle, longTitles);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000014);;
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00010
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00010
     * @tc.desc     PhotoAsset set Invalid argument
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00010'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, AppStorage.get('testNumber'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00011
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00011
     * @tc.desc     PhotoAsset set Invalid argument
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SET_ASSERT_TEST_00011'
      try {
        console.info(TAG, testName, "setAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, AppStorage.get('testArray'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'setAssets failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
  });
}