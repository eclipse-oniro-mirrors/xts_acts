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
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium'
import mediaNative from "libentry.so";
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';

import {
  photoKeys,
  fetchOption,
  createSandboxFileUri, getPermission, driveFn, sleep,
} from '../common'
import common from '@ohos.app.ability.common';

export default function requestVideoNativeTest() {
  describe('requestVideoNativeTest', (done: Function) => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    afterAll(async () => {
      console.info('afterAll case');
      try {
        let files: string[] = fs.listFileSync(testContext.filesDir);
        for (let i = 0; i < files.length; i++) {
          if (files[i].includes('test')) {
            console.info(`requestVideoNativeTest listFiles need to delete:${JSON.stringify(files[i])}}`)
            fs.unlinkSync(`${testContext.filesDir}/${files[i]}`);
          }
        }
      } catch (error) {
        console.error(`requestVideoNativeTest listFiles failed; error: ${error.code}  ${error.message}`)
      }
    });
    
    const ERROR_REQUEST_ID = "00000000-0000-0000-0000-000000000000";
    const REQUEST_ID_LENGTH = 37
    let requestVideoRequestOptions = async (testNum:string, done:Function, requestOptions: photoAccessHelper.RequestOptions, name: string) => {
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, name);
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let result: ESObject = await mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err:BusinessError, state:number, requestId:string ) => {
            console.info(`${testNum} succeed ${state} ${requestId}`);
            expect(state).assertEqual(0);
            expect(requestId.length).assertEqual(REQUEST_ID_LENGTH);
            expect(typeof requestId).assertEqual('string');
            done();
          })
        console.info(`${testNum} result ${result} `);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        expect(typeof result).assertEqual('string');
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    let requestVideoPhotoAssetError = async (testNum:string, done:Function, srcUri: ESObject) => {
      try {
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result: ESObject = mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err:BusinessError, data:ESObject) => {
            console.info(`${testNum} failed ${data}`);
            expect(false).assertTrue();
            done();
          })
        console.info(`${testNum} result ${result}`);
        expect(result.slice(0,36)).assertEqual(ERROR_REQUEST_ID);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    let requestVideodestUriError = async (testNum:string, done:Function, destUri:ESObject) => {
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video_native.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{
            console.info(`${testNum} failed ${data}`);
            expect(false).assertTrue();
            done();
          })
        expect(result.slice(0,36)).assertEqual(ERROR_REQUEST_ID);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0000
     * @tc.name      : test requestImage requestOptions with FAST_MODE
     * @tc.desc      : request video requestOptions with 
     *                  deliveryMode: fastMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_request_option_fast_mode', 0, async (done: Function) => {
      let testNum = 'request_video_native_request_option_fast_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions, "request_video_native.mp4")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0100
     * @tc.name      : test requestVideo requestOptions with HIGH_QUALITY_MODE 
     * @tc.desc      : request video requestOptions with 
     *                  deliveryMode: hignQualityMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_request_option_high_quality_mode', 0, async (done: Function) => {
      let testNum = 'request_video_native_request_option_high_quality_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions, "request_video_native.mp4")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0200
     * @tc.name      : test requestVideo requestOptions with BALANCE_MODE and sourceMode: 
     * @tc.desc      : request video with 
     *                  deliveryMode: BALANCE_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_request_option_balance_mode', 0, async (done: Function) => {
      let testNum = 'request_video_native_request_option_balance_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions, "native_request_mpeg.mpeg")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0300
     * @tc.name      : test requestVideo with srcUri = null
     * @tc.desc      : request video with srcUri = null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_null', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_null';
      let srcUri = null
      await requestVideoPhotoAssetError (testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0400
     * @tc.name      : test requestVideo with srcUri = undefined
     * @tc.desc      : request video with srcUri = undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_undefined', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_undefined';
      let srcUri = undefined
      await requestVideoPhotoAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0500
     * @tc.name      : test requestVideo with srcUri = 'aaaa....mp4'
     * @tc.desc      : request video with srcUri = 'aaaa....mp4'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_test', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_test';
      let srcUri = ''
      for (let i = 0; i < 380; i++) {
        srcUri += 'a'
      }
      srcUri+= '.mp4'
      await requestVideoPhotoAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0600
     * @tc.name      : test requestVideo with photoAsset = true
     * @tc.desc      : request video with photoAsset = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_true', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_true';
      let srcUri = true
      await requestVideoPhotoAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0700
     * @tc.name      : test requestVideo with srcUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.desc      : request video with srcUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_special_string', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_special_string';
      let srcUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
      await requestVideoPhotoAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0800
     * @tc.name      : test requestVideo with photoAsset = true
     * @tc.desc      : request video with photoAsset = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_empty_string', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_empty_string';
      let srcUri = ''
      await requestVideoPhotoAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_0900
     * @tc.name      : test requestVideo with srcUri = {a: 10}
     * @tc.desc      : request video with srcUri = {a: 10}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_uri_extr_long_string', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_uri_extr_long_string';
      let srcUri = ''
      for (let i = 0; i < 385; i++) {
        srcUri += 'a'
      }
      await requestVideoPhotoAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1000
     * @tc.name      : test requestVideo with destUri = null
     * @tc.desc      : request video with destUri = null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_uri_null', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_uri_null';
      let destUri = null
      await requestVideodestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1100
     * @tc.name      : test requestVideo with destUri = undefined
     * @tc.desc      : request video with destUri = undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_uri_undefined', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_uri_undefined';
      let destUri = undefined
      await requestVideodestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1200
     * @tc.name      : test requestVideo with destUri = true
     * @tc.desc      : request video with destUri = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_uri_true', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_uri_true';
      let destUri = true
      await requestVideodestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1300
     * @tc.name      : test requestVideo with destUri = 'aaaa....mp4'
     * @tc.desc      : request video with destUri = 'aaaa....mp4'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_uri_test', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_uri_test';
      let destUri = ''
      for (let i = 0; i < 380; i++) {
        destUri += 'a'
      }
      destUri+= '.mp4'
      await requestVideodestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1400
     * @tc.name      : test requestVideo with destUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.desc      : request video with destUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_uri_special_string', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_uri_special_string';
      let destUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
      await requestVideodestUriError(testNum, done, destUri)
    });

  /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1500
     * @tc.name      : test requestVideo with photoAsset = true
     * @tc.desc      : request video with photoAsset = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_empty_string', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_empty_string';
      let destUri = ''
      await requestVideodestUriError (testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1600
     * @tc.name      : test requestVideo with photoAsset = {a: 10}
     * @tc.desc      : request video with photoAsset = {a: 10}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_dest_uri_extra_long_string', 0, async (done: Function) => {
      let testNum = 'request_video_native_dest_uri_extra_long_string';
      let destUri = ''
      for (let i = 0; i < 385; i++) {
        destUri += 'a'
      }
      await requestVideodestUriError (testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1700
     * @tc.name      : test requestVideo with srcUri : jpg
     * @tc.desc      : request video with srcUri : jpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_image_dest_photo', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_image_dest_photo';

      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image_native.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err:BusinessError, data: ESObject) => {
          console.info(`${testNum} failed ${data}`);
          expect(false).assertTrue();
          done();
        })
        expect(result.slice(0,36)).assertEqual(ERROR_REQUEST_ID);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1800
     * @tc.name      : test requestVideo destUri : ***.jpg
     * @tc.desc      : request video with destUri : ***.jpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_video_dest_image', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_video_dest_image';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video_native.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
       
        let result: ESObject = mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{
            console.info(`${testNum} failed ${data}`);
            expect(false).assertTrue();
            done();
          })
        expect(result.slice(0,36)).assertEqual(ERROR_REQUEST_ID);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_1900
     * @tc.name      : test requestVideo with destUri: ***.jpg, srcUri: ***.jpg
     * @tc.desc      : request video with destUri: ***.jpg, srcUri: ***.jpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_src_image_dest_image', 0, async (done: Function) => {
      let testNum = 'request_video_native_src_image_dest_image';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image_native.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        
        let result: ESObject = mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) => {
            console.info(`${testNum} failed ${data}`);
            expect(false).assertTrue();
            done();
          })
        expect(result.slice(0,36)).assertEqual(ERROR_REQUEST_ID);
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_NATIVE_2000
     * @tc.name      : test requestVideo with error source mp4
     * @tc.desc      : request video with error source mp4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_native_error_assrt_uri', 0, async (done: Function) => {
      let testNum = 'request_video_native_error_assrt_uri';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "native_request_error_mp4.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result: ESObject = await mediaNative.testRequestVideoForPath(srcUri, requestOptions, destUri, (err:BusinessError, state: number, requestId:string ) => {
          console.info(`${testNum} succeed ${state} ${requestId}`);
          expect(state).assertEqual(0);
          expect(requestId.length).assertEqual(REQUEST_ID_LENGTH);
          expect(typeof requestId).assertEqual('string');
          done();
        })
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        expect(typeof result).assertEqual('string');
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  });
}