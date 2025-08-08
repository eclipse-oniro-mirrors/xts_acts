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
  fetchOption,
  photoType,
  photoKeys, getPermission, driveFn, sleep
} from '../common'
import common from '@ohos.app.ability.common';

export default function assetGetAllObjectTest () {
  describe('assetGetAllObjectTest', ()=>{

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let  getAllObjectsCallbackTest = async (done:Function, testNum:string, fetchOps:ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.getAllObjects((err, allObj) => {
          console.info(`${testNum} getAllObjects; err: ${err}`);
          try {
            if (err !== undefined) {
              console.info(`${testNum} getAllObjects failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(allObj.length > 0).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} getAllObjects failed; error: ${error}`);
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

    let  getAllObjectsPromiseTest = async (done:Function, testNum:string, fetchOps:ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount() > 0).assertTrue();
        const allObj = await fetchResult.getAllObjects();
        fetchResult.close();
        expect(allObj.length > 0).assertTrue();
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALL_OBJECTS_0000
     * @tc.name      : getAllObjects_callback_000
     * @tc.desc      : getAllObjects image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAllObjects_callback_000', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getAllObjects_callback_000';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getAllObjectsCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALL_OBJECTS_0000
     * @tc.name      : getAllObjects_promise_000
     * @tc.desc      : getAllObjects image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAllObjects_promise_000', Level.LEVEL0, async (done:Function)=> {
	    const testNum = 'getAllObjects_promise_000';
	    const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
	    await getAllObjectsPromiseTest(done, testNum, fetchOps);
    });
    
    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALL_OBJECTS_0100
     * @tc.name      : getAllObjects_callback_001
     * @tc.desc      : getAllObjects video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAllObjects_callback_001', Level.LEVEL0, async (done:Function)=> {
	    const testNum = 'getAllObjects_callback_001';
	    const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
	    await getAllObjectsCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALL_OBJECTS_0100
     * @tc.name      : getAllObjects_promise_001
     * @tc.desc      : getAllObjects video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAllObjects_promise_001', Level.LEVEL0, async (done:Function)=> {
	    const testNum = 'getAllObjects_promise_001';
	    const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
	    await getAllObjectsPromiseTest(done, testNum, fetchOps);
    });
  })
}
