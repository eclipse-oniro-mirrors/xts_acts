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
import { describe, it, expect } from 'deccjsunit/index'
import mediaNative from "libmediaAssetManager.so";

import {
  photoKeys,
  fetchOption,
  createSandboxFileUri,
} from '../../../../../../../common'

export default function requestCancelNativeTest() {
  describe('requestCancelNativeTest', function (done) {
    
    let helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
    const REQUEST_ID_LENGTH = 37
    async function requestCancel(testNum, done, requestOptions, name) {
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, name);
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri('mp4');
        let result = await mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err, state, requestId ) => {
            console.info(`${testNum} succeed ${state} ${requestId}`);
            expect(state).assertEqual(0);
            expect(requestId.length).assertEqual(REQUEST_ID_LENGTH);
            expect(typeof requestId).assertEqual('string');
            done();
          })
        console.info(`${testNum} result ${result} `);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        expect(typeof result).assertEqual('string');
        let requestCancelResult = await mediaNative.testCancelRequest(result)
        console.info(`${testNum} requestCancelResult ${requestCancelResult} `);
        expect(!requestCancelResult).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CANCEL_NATIVE_0000
     * @tc.name      : test requestImage requestOptions with FAST_MODE
     * @tc.desc      : request video with fast mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_cancel_native_request_option_fast_mode', 0, async function (done) {
      let testNum = 'request_cancel_native_request_option_fast_mode';
      let requestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      }
      await requestCancel(testNum, done, requestOptions, "request_video_native.mp4")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CANCEL_NATIVE_0100
     * @tc.name      : test requestVideo requestOptions with HIGH_QUALITY_MODE 
     * @tc.desc      : request video with high quality mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_cancel_native_request_option_high_quality_mode', 0, async function (done) {
      let testNum = 'request_cancel_native_request_option_high_quality_mode';
      let requestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      }
      await requestCancel(testNum, done, requestOptions, "request_video_native.mp4")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_CANCEL_NATIVE_0200
     * @tc.name      : test requestVideo requestOptions with BALANCE_MODE and sourceMode: 
     * @tc.desc      : request video with high balance mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_cancel_native_request_option_balance_mode', 0, async function (done) {
      let testNum = 'request_cancel_native_request_option_balance_mode';
      let requestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      }
      await requestCancel(testNum, done, requestOptions, "native_request_mpeg.mpeg")
    });
  });
}