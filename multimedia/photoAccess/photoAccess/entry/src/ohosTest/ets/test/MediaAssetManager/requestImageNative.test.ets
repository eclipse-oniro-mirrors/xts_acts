
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

export default function requestImageNativeTest() {
  describe('requestImageNativeTest', (done: Function) =>{
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
            console.info(`requestImageNativeTest listFiles need to delete:${JSON.stringify(files[i])}}`)
            fs.unlinkSync(`${testContext.filesDir}/${files[i]}`);
          }
        }
      } catch (error) {
        console.error(`requestImageNativeTest listFiles failed; error: ${error.code}  ${error.message}`)
      }
    });

    let ERROR_REQUEST_ID = "00000000-0000-0000-0000-000000000000";
    const REQUEST_ID_LENGTH = 37
    let requestImageRequestOptions = async (testNum: string, done: Function, requestOptions: photoAccessHelper.RequestOptions, name: string) => {
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, name);
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let result:ESObject = await mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, state:number, requestId:string) => {
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
    }

    let requestImageSrcUriAssetError = async (testNum: string, done: Function, srcUri: ESObject) => {
      try {
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, data:ESObject) => {
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

    let requestImagedestUriError = async (testNum: string, done: Function, destUri: ESObject) => {
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image_native.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
      
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, data:ESObject) => {
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0000
     * @tc.name      : test requestImage requestOptions with FAST_MODE
     * @tc.desc      : request video with 
     *                  deliveryMode: FAST_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_request_option_fast_mode', 0, async (done: Function) => {
      let testNum = 'request_image_native_request_option_fast_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      }
      await requestImageRequestOptions(testNum, done, requestOptions, "request_image_native.jpg")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0100
     * @tc.name      : test requestImage requestOptions with HIGH_QUALITY_MODE
     * @tc.desc      : request video with 
     *                  deliveryMode: HIGH_QUALITY_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_request_option_high_quality_mode', 0, async (done: Function) => {
      let testNum = 'request_image_native_request_option_high_quality_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      }
      await requestImageRequestOptions(testNum, done, requestOptions, "native_request_gif.gif")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0200
     * @tc.name      : test requestImage requestOptions with BALANCE_MODE
     * @tc.desc      : request video with 
     *                  deliveryMode: BALANCE_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_request_option_balance_mode', 0, async (done: Function) => {
      let testNum = 'request_image_native_request_option_balance_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      }
      await requestImageRequestOptions(testNum, done, requestOptions, "native_request_png.png")
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0300
     * @tc.name      : test requestImage with srcUri = null
     * @tc.desc      : request video with srcUri = null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_null', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_null';
      let srcUri = null
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0400
     * @tc.name      : test requestImage with srcUri = undefined
     * @tc.desc      : request video with srcUri = undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_undefined', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_undefined';
      let srcUri = undefined
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0500
     * @tc.name      : test requestImage with srcUri = 'aaaa....jpg'
     * @tc.desc      : request video with srcUri = 'aaaa....jpg'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_test', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_test';
      let srcUri = ''
      for (let i = 0; i < 380; i++) {
        srcUri += 'a'
      }
      srcUri+= '.jpg'
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0600
     * @tc.name      : test requestImage with srcUri = true
     * @tc.desc      : request video with srcUri = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_true', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_true';
      let srcUri = true
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0700
     * @tc.name      : test requestImage with srcUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.desc      : request video with srcUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_special_string', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_special_string';
      let srcUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0800
     * @tc.name      : test requestImage with photoAsset = ''
     * @tc.desc      : request video with photoAsset = ''
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_empty_string', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_empty_string';
      let srcUri = ''
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_0900
     * @tc.name      : test requestImage with srcUri = extra long string
     * @tc.desc      : request video with srcUri = extra long string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_uri_extr_long_string', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_uri_extr_long_string';
      let srcUri = ''
      for (let i = 0; i < 385; i++) {
        srcUri += 'a'
      }
      await requestImageSrcUriAssetError(testNum, done, srcUri)
    });


    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1000
     * @tc.name      : test requestImage with destUri = null
     * @tc.desc      : request video with destUri = null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_uri_null', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_uri_null';
      let destUri = null
      await requestImagedestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1100
     * @tc.name      : test requestImage with destUri = undefined
     * @tc.desc      : request video with destUri = undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_uri_undefined', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_uri_undefined';
      let destUri = undefined
      await requestImagedestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1200
     * @tc.name      : test requestImage with destUri = true
     * @tc.desc      : request video with destUri = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_uri_true', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_uri_true';
      let destUri = true
      await requestImagedestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1300
     * @tc.name      : test requestImage with destUri = 'aaaa.....jpg'
     * @tc.desc      : request video with destUri = 'aaaa......jpg'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_uri_test', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_uri_test';
      let destUri = ''
      for (let i = 0; i < 380; i++) {
        destUri += 'a'
      }
      destUri+= '.jpg'
      await requestImagedestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1400
     * @tc.name      : test requestImage with destUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.desc      : request video with destUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_uri_special_string', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_uri_special_string';
      let destUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
      await requestImagedestUriError(testNum, done, destUri)
    });



     /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1500
     * @tc.name      : test requestImage with photoAsset = ''
     * @tc.desc      : request video with photoAsset = ''
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_empty_string', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_empty_string';
      let destUri = ''
      await requestImagedestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1600
     * @tc.name      : test requestImage with srcUri = extra long string
     * @tc.desc      : request video with srcUri = extra long string
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_dest_uri_extra_long_string', 0, async (done: Function) => {
      let testNum = 'request_image_native_dest_uri_extra_long_string';
      let destUri = ''
      for (let i = 0; i < 385; i++) {
        destUri += 'a'
      }
      await requestImagedestUriError(testNum, done, destUri)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1700
     * @tc.name      : test requestImage with srcUri : mp4
     * @tc.desc      : request video with srcUri : mp4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_photo_dest_image', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_photo_dest_image';

      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video_native.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, data:ESObject) => {
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1800
     * @tc.name      : test requestImage destUri : ***.mp4
     * @tc.desc      : request video with destUri : ***.mp4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_image_dest_video', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_image_dest_video';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image_native.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, data:ESObject) => {
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_1900
     * @tc.name      : test requestImage with destUri: ***.mp4, srcUri: ***.mp4
     * @tc.desc      : request video with destUri: ***.mp4, srcUri: ***.mp4
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_src_video_dest_video', 0, async (done: Function) => {
      let testNum = 'request_image_native_src_video_dest_video';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video_native.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }

        let result:ESObject = mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, data:ESObject) =>{
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_NATIVE_2000
     * @tc.name      : test requestImage with error source jpg
     * @tc.desc      : request video with error source jpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_native_error_assrt_uri', 0, async (done: Function) => {
      let testNum = 'request_image_native_error_assrt_uri';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "native_request_error_jpg.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.info(`${testNum} srcUri` +srcUri);
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result:ESObject = await mediaNative.testRequestImageForPath(srcUri, requestOptions, destUri, (err:BusinessError, state:number, requestId:string) => {
            console.info(`${testNum} succeed ${state} ${requestId}`);
            expect(state).assertEqual(0);
            expect(requestId.length).assertEqual(REQUEST_ID_LENGTH);
            expect(typeof requestId).assertEqual('string');
            done();
          })
        expect(result.length).assertEqual(REQUEST_ID_LENGTH);
        expect(typeof result).assertEqual('string');
        done()
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

  });
}