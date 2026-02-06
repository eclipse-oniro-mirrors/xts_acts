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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { Driver } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'getObjectByPositionSupp';

async function getObjectByPositionCallbackTest(done: Function, testName: string, index:number,callback: (res:photoAccessHelper.PhotoAsset|undefined,errCode?: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
    fetchResult.getObjectByPosition(index, (err, photoAsset) => {
      if (photoAsset !== undefined) {
        console.info(TAG,testName,'photoAsset ByPositionCallback displayName: ', photoAsset.displayName);
        callback(photoAsset,undefined)
      } else {
        console.error(TAG,testName,`photoAsset ByPositionCallback failed with err: ${err.code}, ${err.message}`);
      }
      done();
    });
  }catch (error) {
    console.error(TAG, testName,`failed; error: ${error},${error.code},${error.message}`, testName);
    callback(undefined,error.code);
    done();
  }

}
async function getObjectByPositionPromiseTest(done: Function, testName: string,index:number, callback: (res:photoAccessHelper.PhotoAsset|undefined,errCode?: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(index);
    console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
    callback(photoAsset,undefined);
    done();
  }catch (error) {
    console.error(TAG, testName,`failed; error: ${error},${error.code},${error.message}`, testName);
    callback(undefined,error.code)
    done();
  }

}

let power: ESObject;

export default function photoAccessHelperGetObjectByPositionTest() {
  describe('photoAccessHelperGetObjectByPositionTest', () => {
    let dr = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
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
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001
     * @tc.desc   phAccessHelper.getObjectByPosition index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_001';
      await getObjectByPositionCallbackTest(done, testName, 0, (res:photoAccessHelper.PhotoAsset | undefined,errCode?:number) => {
        expect(res!=undefined).assertTrue();

      });
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002
     * @tc.desc   phAccessHelper.getObjectByPosition index 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_002';
      await getObjectByPositionCallbackTest(done, testName, 1, (res:photoAccessHelper.PhotoAsset | undefined,errCode?:number) => {
        expect(res!=undefined).assertTrue();

      });
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003
     * @tc.desc   phAccessHelper.getObjectByPosition index -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_CALLBACK_003';
      await getObjectByPositionCallbackTest(done, testName, -1, (res:photoAccessHelper.PhotoAsset | undefined,errCode?:number) => {
        expect(errCode).assertEqual(14000011);

      });
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001
     * @tc.desc   phAccessHelper.getObjectByPosition index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001';
      await getObjectByPositionPromiseTest(done, testName, 0, (res:photoAccessHelper.PhotoAsset | undefined,errCode?:number) => {
        expect(res!=undefined).assertTrue();

      });
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002
     * @tc.desc   phAccessHelper.getObjectByPosition index 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002';
      await getObjectByPositionPromiseTest(done, testName, 1, (res:photoAccessHelper.PhotoAsset | undefined,errCode?:number) => {
        expect(res!=undefined).assertTrue();

      });
    })
    /**
     * @tc.name   PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003
     * @tc.number PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003
     * @tc.desc   phAccessHelper.getObjectByPosition index -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003';
      await getObjectByPositionPromiseTest(done, testName, -1, (res:photoAccessHelper.PhotoAsset | undefined,errCode?:number) => {
        expect(errCode).assertEqual('14000011');
      });
    })

  })
}