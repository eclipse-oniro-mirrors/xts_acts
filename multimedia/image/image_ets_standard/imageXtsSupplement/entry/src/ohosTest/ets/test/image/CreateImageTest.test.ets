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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { PixelMapFormat } from '@kit.MediaLibraryKit';
import { resourceManager } from '@kit.LocalizationKit';
import { common } from '@kit.AbilityKit';

const TAG = 'ImageXts.CreateImageTest';

export default function CrateImageSupp() {
  describe('CrateImageSupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
    });
    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });
    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case');
    });
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_001
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_001
     * @tc.desc       createImageSource cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_001';
      try {
        let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
        const imageSourceObj: image.ImageSource = image.createImageSource(null, sourceOptions);
        console.error(TAG, testName, '未触发预期的异常！', imageSourceObj);
        expect(imageSourceObj).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_002
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_002
     * @tc.desc       createImageSource cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_002';
      try {
        let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
        const imageSourceObj: image.ImageSource = image.createImageSource(undefined, sourceOptions);
        console.error(TAG, testName, '未触发预期的异常！', imageSourceObj);
        expect(imageSourceObj).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_003
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_003
     * @tc.desc       createImageSource cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_003';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        AppStorage.setOrCreate('key', null);
        let sourceOptions: image.SourceOptions = AppStorage.get('key') as ESObject;
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.error(TAG, testName, '未触发预期的异常！', imageSourceObj);
        expect(imageSourceObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_004
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_004
     * @tc.desc       createImageSource cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_004';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        AppStorage.setOrCreate('key', undefined);
        let sourceOptions: image.SourceOptions = AppStorage.get('key') as ESObject;
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.error(TAG, testName, '未触发预期的异常！', imageSourceObj);
        expect(imageSourceObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_005
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_005
     * @tc.desc       createImageSource cover sourceDensity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_005';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourceDensity为：' + sourceOptions.sourceDensity);
        expect(sourceOptions.sourceDensity).assertEqual(120);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_006
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_006
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_006';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(0);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_007
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_007
     * @tc.desc       createImageSource cover sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_007';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourceSize为：' + sourceOptions.sourceSize?.height);
        expect(sourceOptions.sourceSize?.height).assertEqual(4);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_008
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_008
     * @tc.desc       createImageSource cover sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_008';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourceSize为：' + sourceOptions.sourceSize?.width);
        expect(sourceOptions.sourceSize?.width).assertEqual(6);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_009
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_009
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_009';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.RGBA_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(1);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_010
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_010
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_010';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.NV21,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(2);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_011
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_011
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_011';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.RGBA_1010102,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(3);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_012
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_012
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_012';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.YCBCR_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(4);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_013
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_013
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_013';
      try {
        const data: ArrayBuffer = new ArrayBuffer(112);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.YCRCB_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const imageSourceObj: image.ImageSource = image.createImageSource(data, sourceOptions);
        console.info(TAG, testName, 'sourceOptions.sourcePixelFormat为：' + sourceOptions.sourcePixelFormat);
        expect(sourceOptions.sourcePixelFormat).assertEqual(5);
      } catch (error) {
        console.error(TAG, testName, `Failed to create ImageSource.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_014
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_014
     * @tc.desc       createImageReceiver cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_014", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_014';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(null, 8192, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_015
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_015
     * @tc.desc       createImageReceiver cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_015", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_015';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, null, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_016
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_016
     * @tc.desc       createImageReceiver cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_016", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_016';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8192, null, 8);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_017
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_017
     * @tc.desc       createImageReceiver cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_017", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_017';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8192, image.ImageFormat.JPEG, null);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_018
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_018
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_018", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_018';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(undefined, 8192, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_019
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_019
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_019", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_019';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, undefined, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_020
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_020
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_020", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_020';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8192, undefined, 8);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_021
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_021
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_021", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_021';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8192, image.ImageFormat.JPEG, undefined);
        console.error(TAG, testName, '未触发预期的异常！', receiver);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_022
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_022
     * @tc.desc       createImageReceiver cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_022", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_022';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8192, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, '', receiver.size.height);
        expect(receiver.size.height).assertEqual(8192);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_023
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_023
     * @tc.desc       createImageReceiver cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it("SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_023", Level.LEVEL0,async (done: Function)  => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_RECEIVER_TEST_023';
      try {
        let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8192, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, '', receiver.size.width);
        expect(receiver.size.width).assertEqual(8192);
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_024
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_024
     * @tc.desc       createImageSource cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_024';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, null);
          console.error(TAG, testName, '未触发预期的异常！', imageSourceObj);
          expect(imageSourceObj != null).assertTrue();
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_025
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_025
     * @tc.desc       createImageSource cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_025';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, undefined);
          console.error(TAG, testName, '未触发预期的异常！', imageSourceObj);
          expect(imageSourceObj != undefined).assertTrue();
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_026
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_026
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_026';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.UNKNOWN,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(0);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_027
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_027
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_027';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.RGBA_8888,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(1);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_028
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_028
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_028';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.NV21,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(2);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_029
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_029
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_029';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.RGBA_1010102,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(3);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_030
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_030
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_030';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.YCBCR_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(4);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_031
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_031
     * @tc.desc       createImageSource cover sourcePixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_031';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: PixelMapFormat.YCRCB_P010,
          sourceSize: { height: 4, width: 6 },
        };
        const resourceMgr: resourceManager.ResourceManager = context.resourceManager;
        resourceMgr.getRawFd('test_exif_v2.jpg').then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
          const imageSourceObj = image.createImageSource(rawFileDescriptor, sourceOptions);
          console.info(TAG, testName, 'sourceOptions.sourcePixelFormat:'+ sourceOptions.sourcePixelFormat);
          expect(sourceOptions.sourcePixelFormat).assertEqual(5);
          done();
        })
      } catch (error) {
        console.error(TAG, testName, `获取RawFd失败: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_032
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_032
     * @tc.desc       createImageReceiver cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_032';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver.size为：' + receiver.size.height)
        expect(receiver.size.height).assertEqual(8192);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_033
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_033
     * @tc.desc       createImageReceiver cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_033';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver.size为：' + receiver.size.width)
        expect(receiver.size.width).assertEqual(8192);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_034
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_034
     * @tc.desc       createImageReceiver cover capacity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_034';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver.capacity为：' + receiver.capacity)
        expect(receiver.capacity).assertEqual(8);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_035
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_035
     * @tc.desc       createImageReceiver cover format
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_035';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
        console.info(TAG, testName, 'receiver.format为：' + receiver.format)
        expect(receiver.format).assertEqual(2000);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_036
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_036
     * @tc.desc       createImageReceiver cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_036';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, null);
        console.info(TAG, testName, '未触发预期的错误！',receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_037
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_037
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_037';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, undefined);
        console.error(TAG, testName, '未触发预期的错误！',receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_038
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_038
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_038';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let receiver: image.ImageReceiver = image.createImageReceiver(size, image.ImageFormat.JPEG, undefined);
        console.error(TAG, testName, '未触发预期的错误！',receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_039
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_039
     * @tc.desc       createImageReceiver cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_039';
      try {
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(null);
        console.error(TAG, testName, '未触发预期的错误！',receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_040
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_040
     * @tc.desc       createImageReceiver cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_040';
      try {
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(undefined);
        console.error(TAG, testName, '未触发预期的错误！',receiver);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_041
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_041
     * @tc.desc       createImageReceiver cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_041';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'size.height：'+ receiver?.size.height);
        expect(receiver?.size.height).assertEqual(480);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_042
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_042
     * @tc.desc       createImageReceiver cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_042';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'size.width为：'+ receiver?.size.width);
        expect(receiver?.size.width).assertEqual(480);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_043
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_043
     * @tc.desc       createImageReceiver cover return capacity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_043';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'capacity为：'+ receiver?.capacity);
        expect(receiver?.capacity).assertEqual(3);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_044
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_044
     * @tc.desc       createImageCreator cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_044';
      try {
        let creator: image.ImageCreator = image.createImageCreator(null, 8192, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_045
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_045
     * @tc.desc       createImageCreator cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_045';
      try {
        let creator: image.ImageCreator = image.createImageCreator(8192, null, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_046
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_046
     * @tc.desc       createImageCreator cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_046';
      try {
        let creator: image.ImageCreator = image.createImageCreator(8192, 8192, null, 8);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_047
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_047
     * @tc.desc       createImageCreator cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_047';
      try {
        let creator: image.ImageCreator = image.createImageCreator(8192, 8192, image.ImageFormat.JPEG, null);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_048
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_048
     * @tc.desc       createImageCreator cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_048';
      try {
        let creator: image.ImageCreator = image.createImageCreator(undefined, 8192, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_049
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_049
     * @tc.desc       createImageCreator cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_049';
      try {
        let creator: image.ImageCreator = image.createImageCreator(8192, undefined, image.ImageFormat.JPEG, 8);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_050
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_050
     * @tc.desc       createImageCreator cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_050';
      try {
        let creator: image.ImageCreator = image.createImageCreator(8192, 8192, undefined, 8);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_051
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_051
     * @tc.desc       createImageCreator cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_051';
      try {
        let creator: image.ImageCreator = image.createImageCreator(8192, 8192, image.ImageFormat.JPEG, undefined);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_052
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_052
     * @tc.desc       createImageCreator cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_052';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, null);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_053
     * @tc.name       SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_053
     * @tc.desc       createImageCreator cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_IMAGE_SOURCE_TEST_053';
      try {
        let size: image.Size = {
          height: 8192,
          width: 8192
        }
        let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, undefined);
        console.error(TAG, testName, '未触发预期的错误！', creator);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })




  })
}

