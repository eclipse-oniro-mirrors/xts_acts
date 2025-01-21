/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium'
import {
  photoKeys,
  fetchOption,
} from '../../../../../../../common'

export default function getAssetsTest () {
  describe('getAssetsTest', () => {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

    const getAssetsCallbackTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        helper.getAssets(fetchOps, (err, fetchResult) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getAssets failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(fetchResult.getCount()).assertEqual(expectCount);
              fetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} getAssets failed; error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const getAssetsAbnormalCallbackTest = async (done: Function, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions | undefined) => {
      try {
        helper.getAssets(fetchOps, (err, fetchResult) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getAssets failed; err: ${err}`);
              expect(true).assertTrue();
            } else {
              console.info(`${testNum} getAssets suc; fetchResult: ${fetchResult.getCount()}`);
              fetchResult.close();
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} getAssets failed; error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    const getAssetsPromiseTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const getAssetsAbnormalPromiseTest = async (done: Function, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions | undefined) => {
      try {
        await helper.getAssets(fetchOps);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    //image
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0000
     * @tc.name      : getAssets_callback_000
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_callback_000', 0, async (done: Function) => {
      const testNum = 'getAssets_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const expectCount = 1;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0100
     * @tc.name      : getAssets_callback_001
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_callback_001', 0, async (done: Function) => {
      const testNum = 'getAssets_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '666');
      const expectCount = 0;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0300
     * @tc.name      : getAssets_callback_003
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAssets_callback_003', 2, async (done: Function) => {
      const testNum = 'getAssets_callback_003';
      await getAssetsAbnormalCallbackTest(done, testNum, undefined);
    });
    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0000
     * @tc.name      : getAssets_promise_000
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_promise_000', 0, async (done: Function) => {
      const testNum = 'getAssets_promise_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0100
     * @tc.name      : getAssets_promise_001
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_promise_001', 0, async (done: Function) => {
      const testNum = 'getAssets_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '666');
      const expectCount = 0;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0300
     * @tc.name      : getAssets_promise_003
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAssets_promise_003', 2, async (done: Function) => {
      const testNum = 'getAssets_promise_003';
      await getAssetsAbnormalPromiseTest(done, testNum, undefined);
    });
    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0400
     * @tc.name      : getAssets_callback_004
     * @tc.desc      : getAssets video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_callback_004', 0, async (done: Function) => {
      const testNum = 'getAssets_callback_004';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const expectCount = 1;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });
    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0400
     * @tc.name      : getAssets_promise_004
     * @tc.desc      : getAssets video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_promise_004', 0, async (done: Function) => {
      const testNum = 'getAssets_promise_004';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });
  })
}
