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
 import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import hilog from '@ohos.hilog'
import Context from "application.Context"
import { BusinessError } from '@ohos.base'
import { fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function getAssetsTest() {
  describe('getAssetsTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext)

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    const getAssetsCallbackTest = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      expectCount: number): Promise<void> => {
      try {
        (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps, (err: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          try {
            if (err?.code !== 0) {
              hilog.info(domain, tag,
                testNum + 'getAssets failed' + ", err.code:" + err?.code + ", err.message:" + err?.message);
              expect(false).assertTrue();
            } else {
              expect(fetchResult?.getCount()).assertEqual(expectCount);
              fetchResult?.close();
            }
          } catch (error: Error) {
            hilog.info(domain, tag,
              testNum + ' getAssets failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          }
          done();
        });
      } catch (error: Error) {
        hilog.info(domain, tag,
          testNum + ' test failed' + ", error.name:" + error.name + ", error.message:" + error.message);
        expect(false).assertTrue();
        done();
      }
    }

    const getAssetsAbnormalCallbackTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions | undefined): Promise<void> => {
      try {
        (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps as photoAccessHelper.FetchOptions, (err: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined): void => {
          try {
            if (err?.code !== 0) {
              hilog.info(domain, tag,
                testNum + 'getAssets failed' + ", err.code:" + err?.code + ", err.message:" + err?.message);
            } else {
              hilog.info(domain, tag, testNum + 'getAssets suc' + "fetchResult: " + fetchResult?.getCount())
              fetchResult?.close();
              expect(false).assertTrue();
            }
          } catch (error: Error) {
            hilog.info(domain, tag,
              testNum + ' getAssets failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          }
          done();
        });
      } catch (error: Error) {
        hilog.info(domain, tag,
          testNum + ' test failed' + ", error.name:" + error.name + ", error.message:" + error.message);
        done();
      }
    }

    const getAssetsPromiseTest = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      expectCount: number): Promise<void> => {
      try {
        const fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        fetchResult.close();
        done();
      } catch (error: Error) {
        hilog.info(domain, tag,
          testNum + ' test failed' + ", error.name:" + error.name + ", error.message:" + error.message);
        expect(false).assertTrue();
        done();
      }
    }

    const getAssetsAbnormalPromiseTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions | undefined): Promise<void> => {
      try {
        await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps as photoAccessHelper.FetchOptions);
        expect(false).assertTrue();
        done();
      } catch (error: Error) {
        hilog.info(domain, tag,
          testNum + ' test failed' + ", error.name:" + error.name + ", error.message:" + error.message);
        done();
      }
    }

    const getAssetsAbnormalCallbackWithInvalidTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions | "invalid"): Promise<void> => {
      try {
        (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps as photoAccessHelper.FetchOptions, (err: BusinessError | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          try {
            if (err?.code !== 0) {
              console.info(`${testNum} getAssets failed; err: ${err},  ${err?.code}`);
              expect(err?.code).assertEqual('14000011');
            } else {
              console.info(`${testNum} getAssets suc; fetchResult: ${fetchResult?.getCount()}`);
              fetchResult?.close();
              expect(false).assertTrue();
            }
          } catch (error: BusinessError) {
            console.info(`${testNum} getAssets failed; error: ${error},  ${error.code}`);
            expect(error.code).assertEqual('14000011');
          }
          done();
        });
      } catch (error: BusinessError) {
        console.info(`${testNum} failed; error: ${error},  ${error.code}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    }

    const getAssetsAbnormalPromiseWithInvalidTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions | "invalid"): Promise<void> => {
      try {
        await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps as photoAccessHelper.FetchOptions);
        expect(false).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${testNum} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    }

    //image
    //callback
    /**
     * @tc.name   getAssets_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_STATIC_0000
     * @tc.desc   getAssets image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_callback_static_000';
        const fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getAssetTest.jpg');
        const expectCount = 1;
        await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
      });
    /**
     * @tc.name   getAssets_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_STATIC_0100
     * @tc.desc   getAssets image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_callback_static_001';
        const fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, '666');
        const expectCount = 0;
        await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
      });
    /**
     * @tc.name   getAssets_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_STATIC_0300
     * @tc.desc   getAssets image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_callback_static_003';
        await getAssetsAbnormalCallbackTest(done, testNum, undefined);
      });
    //promise
    /**
     * @tc.name   getAssets_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_STATIC_0000
     * @tc.desc   getAssets image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_promise_static_000';
        const fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getAssetTest.jpg');
        const expectCount = 1;
        await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
      });
    /**
     * @tc.name   getAssets_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_STATIC_0100
     * @tc.desc   getAssets image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_promise_static_001';
        const fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, '666');
        const expectCount = 0;
        await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
      });
    /**
     * @tc.name   getAssets_promise_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_STATIC_0300
     * @tc.desc   getAssets image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAssets_promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_promise_static_003';
        await getAssetsAbnormalPromiseTest(done, testNum, undefined);
      });
    //video
    //callback
    /**
     * @tc.name   getAssets_callback_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_STATIC_0400
     * @tc.desc   getAssets video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_callback_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_callback_static_004';
        const fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
        const expectCount = 1;
        await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
      });
    //promise
    /**
     * @tc.name   getAssets_promise_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_STATIC_0400
     * @tc.desc   getAssets video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAssets_promise_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAssets_promise_static_004';
        const fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
        const expectCount = 1;
        await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
      });
  })
}
