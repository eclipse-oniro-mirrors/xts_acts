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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { Driver } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'PhotoGetObjectByPositionSupp';

async function getObjectByPositionCallbackTestSupp(testName: string, callback: (fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
  console.info(TAG, testName,'photoAccessHelper.FetchResult success: ', fetchResult, callback);
  callback(fetchResult);
}
async function getObjectByPositionPromiseTestSupp(testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
  console.info(TAG, testName,'photoAccessHelper.FetchResult success: ', fetchResult);
  return fetchResult;
}

export default function photoFetchResultGetObjectByPositionTestSupp() {
  describe('photoFetchResultGetObjectByPositionTestSupp', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let checkFetchResult = (done: Function, testNum: string, fetchResult:
    photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> |
    photoAccessHelper.FetchResult<photoAccessHelper.Album>) =>{
      if (fetchResult === undefined) {
        expect().assertFail();
        done();
      }
      let fetchCount: number = fetchResult.getCount();
      if (fetchCount === undefined || fetchCount < 0) {
        expect().assertFail();
        done();
      }
    }
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
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001
     * @tc.desc   phAccessHelper.getObjectByPosition index is null 入参为null场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001';
      try{
        await getObjectByPositionCallbackTestSupp(testName, async (fetchResult) => {
          let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(null as ESObject);
          console.info(TAG,testName, 'success', photoAsset);
          expect(photoAsset).assertUndefined();
        })
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
      }finally {
        done();
      }
    })
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002
     * @tc.desc   phAccessHelper.getObjectByPosition index is undefined 入参为undefined场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002';
      try{
        await getObjectByPositionCallbackTestSupp(testName, async (fetchResult) => {
          let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(undefined as ESObject);
          console.info(TAG,testName, 'success', photoAsset);
          expect(photoAsset).assertUndefined();
        })
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
      }finally {
        done();
      }
    })
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003
     * @tc.desc   phAccessHelper.getObjectByPosition index -2 最小合法值-2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003';
      try{
        await getObjectByPositionCallbackTestSupp(testName, async (fetchResult) => {
          let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(-2);
          console.info(TAG,testName, 'success', photoAsset.displayName);
          expect().assertFail();
        })
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
      }finally {
        done();
      }
    })
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_004
     * @tc.desc   phAccessHelper.getObjectByPosition index 999999 超大正数越界值检查
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_004';
      try{
        await getObjectByPositionCallbackTestSupp(testName, async (fetchResult) => {
          let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(999999);
          console.info(TAG,testName, 'success', photoAsset.displayName);
          expect().assertFail();
        })
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
      }finally {
        done();
      }
    })
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_005
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_005
     * @tc.desc   phAccessHelper.getObjectByPosition index is null promise版入参为null场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_005';
      try{
        const fetchResult = await getObjectByPositionPromiseTestSupp(testName);
        let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(null as ESObject);
        console.info(TAG,testName, 'success', photoAsset);
        expect(photoAsset).assertUndefined();
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
      } finally {
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_006
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_006
     * @tc.desc   phAccessHelper.getObjectByPosition index is undefined promise版入参为undefined场景覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_006';
      try{
        const fetchResult = await getObjectByPositionPromiseTestSupp(testName);
        let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(undefined as ESObject);
        console.info(TAG,testName, 'success', photoAsset);
        expect(photoAsset).assertUndefined();
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
      } finally {
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_007
     * @tc.desc   phAccessHelper.getObjectByPosition index -2 promise版最小数值减2，负数值边界越界检查
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_007';
      try{
        const fetchResult = await getObjectByPositionPromiseTestSupp(testName);
        let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(-2);
        console.info(TAG,testName, 'success', photoAsset);
        expect().assertFail();
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
      } finally {
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_008
     * @tc.desc   phAccessHelper.getObjectByPosition index 999999 promise版超大正数越界值检查
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_008';
      try{
        const fetchResult = await getObjectByPositionPromiseTestSupp(testName);
        let photoAsset : photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(999999);
        console.info(TAG,testName, 'success', photoAsset);
        expect().assertFail();
      }catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(14000011);
      } finally {
        done();
      }
    });
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_001
     * @tc.desc   getRangeObjects-第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_001';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(null, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_002
     * @tc.desc   getRangeObjects-第一个参数为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_002';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(AppStorage.get('emptyString'), 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_003
     * @tc.desc   getRangeObjects-第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_003';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(undefined, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_004
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_004
     * @tc.desc   getRangeObjects-第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_004';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(1, null);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_005
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_005
     * @tc.desc   getRangeObjects-第二个参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_005';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(1, AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_006
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_006
     * @tc.desc   getRangeObjects-第二个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_006';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(1, undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_007
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_007
     * @tc.desc   getRangeObjects-第一个参数超大值-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_007';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(999999, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_008
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_008
     * @tc.desc   getRangeObjects-第二个参数超大值-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_008';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(1, 999999);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_009
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_009
     * @tc.desc   getRangeObjects-第一个参数为负值-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_009';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(-5, 1);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_0010
     * @tc.number PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_0010
     * @tc.desc   getRangeObjects-第二个参数为负值-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_RANGE_OBJECTS_PROMISE_0010';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getRangeObjects(1, -5);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_001
     * @tc.desc   getObjectsByIndexSet-负数-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_001';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getObjectsByIndexSet([-1,2]);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_002
     * @tc.desc   getObjectsByIndexSet-null-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_002';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getObjectsByIndexSet(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_003
     * @tc.desc   getObjectsByIndexSet-undefined-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_003';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getObjectsByIndexSet(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_004
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_004
     * @tc.desc   getObjectsByIndexSet-负数-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_004';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getObjectsByIndexSet([1,-2]);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_005
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_005
     * @tc.desc   getObjectsByIndexSet-空数组-23800151
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_005';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        await fetchResult.getObjectsByIndexSet([]);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_006
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_006
     * @tc.desc   getObjectsByIndexSet-[1,1]正常场景
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECTS_BY_INDEX_SET_006';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        const result = await fetchResult.getObjectsByIndexSet([1,1]);
        expect(Array.isArray(result)).assertEqual(true);
        expect(result.length).assertEqual(2);
        console.info(TAG, `${testName} - Success：${result.length}`, testName);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_001
     * @tc.desc   getIndex-null情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_001';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.getIndex(null);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(-1);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_002
     * @tc.desc   getIndex-undefined情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_002';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.getIndex(undefined);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(-1);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_003
     * @tc.desc   getIndex-Invalid argument type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_003';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.getIndex(AppStorage.get('emptyString'));
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_004
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_004
     * @tc.desc   getIndex- CheckArgValue failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_004';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.getIndex({} as ESObject);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_005
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_005
     * @tc.desc   getIndex- CheckArgValue failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_005';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.getIndex([] as ESObject);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_006
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_006
     * @tc.desc   getIndex-normal-getFirstObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_006';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        const validPhotoAsset = await fetchResult.getFirstObject();
        let isContains = await fetchResult.getIndex(validPhotoAsset);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(0);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_INDEX_007
     * @tc.number PHOTO_ACCESS_HELPER_GET_INDEX_007
     * @tc.desc   getIndex-normal-getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_INDEX_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_INDEX_007';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        const validPhotoAsset = await fetchResult.getLastObject();
        let isContains = await fetchResult.getIndex(validPhotoAsset);
        const totalCount = await fetchResult.getCount();
        const expectedIndex = totalCount - 1;
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(expectedIndex);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_CONTAINS_001
     * @tc.number PHOTO_ACCESS_HELPER_CONTAINS_001
     * @tc.desc   contains-null情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_CONTAINS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_CONTAINS_001';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.contains(null);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(false);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_CONTAINS_002
     * @tc.number PHOTO_ACCESS_HELPER_CONTAINS_002
     * @tc.desc   contains-undefined情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_CONTAINS_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_CONTAINS_002';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        checkFetchResult(done, testName, fetchResult );
        let isContains = await fetchResult.contains(undefined);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(false);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_CONTAINS_003
     * @tc.number PHOTO_ACCESS_HELPER_CONTAINS_003
     * @tc.desc   contains-空字符串情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_CONTAINS_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_CONTAINS_003';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        let isContains = await fetchResult.contains(AppStorage.get('emptyString'));
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_CONTAINS_004
     * @tc.number PHOTO_ACCESS_HELPER_CONTAINS_004
     * @tc.desc   contains-空[]情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_CONTAINS_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_CONTAINS_004';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        let isContains = await fetchResult.contains([] as ESObject);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_CONTAINS_005
     * @tc.number PHOTO_ACCESS_HELPER_CONTAINS_005
     * @tc.desc   contains-getFirstObject情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_CONTAINS_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_CONTAINS_005';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        const validPhotoAsset = await fetchResult.getFirstObject();
        let isContains = await fetchResult.contains(validPhotoAsset);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(true);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_CONTAINS_006
     * @tc.number PHOTO_ACCESS_HELPER_CONTAINS_006
     * @tc.desc   contains-getLastObject情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_CONTAINS_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_CONTAINS_006';
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOption);
      try {
        const validPhotoAsset = await fetchResult.getLastObject();
        let isContains = await fetchResult.contains(validPhotoAsset);
        console.info(TAG , testName, 'addAssets successfully',isContains);
        expect(isContains).assertEqual(true);
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect().assertFail();
        done();
      }
    })

  })
}