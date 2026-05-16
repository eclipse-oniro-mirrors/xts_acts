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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { photoType, photoKeys, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common';


export default function assetGetFirstObjectTest() {
  describe('assetGetFirstObjectTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext)

    let getFirstObjectCallbackTest = async (done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.getFirstObject((err, asset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} asset: ${asset.displayName}`);
              expect(asset !== undefined).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          fetchResult.close();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getFirstObjectPromiseTest = async (done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        const asset = await fetchResult.getFirstObject();
        fetchResult.close();
        console.info(`${testNum} asset: ${asset.displayName}`);
        expect(asset !== undefined).assertTrue();
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
    });

    //image
    //callback
    /**
     * @tc.name   getFirstObject_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_FIRST_OBJECT_0000
     * @tc.desc   getFirstObject image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getFirstObject_callback_000';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.IMAGE).and().equalTo(photoKeys.DISPLAY_NAME, '01.jpg');
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getFirstObjectCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.name   getFirstObject_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_FIRST_OBJECT_0000
     * @tc.desc   getFirstObject image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getFirstObject_promise_000';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.IMAGE).and().equalTo(photoKeys.DISPLAY_NAME, '01.jpg');
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getFirstObjectPromiseTest(done, testNum, fetchOps);
    });

    //video
    //callback
    /**
     * @tc.name   getFirstObject_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_FIRST_OBJECT_0100
     * @tc.desc   getFirstObject video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getFirstObject_callback_001';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.VIDEO).and().equalTo(photoKeys.DISPLAY_NAME, '01.mp4');
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getFirstObjectCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.name   getFirstObject_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_FIRST_OBJECT_0100
     * @tc.desc   getFirstObject video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getFirstObject_promise_001';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.VIDEO).and().equalTo(photoKeys.DISPLAY_NAME, '01.mp4');
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await getFirstObjectPromiseTest(done, testNum, fetchOps);
    });
  })
}
