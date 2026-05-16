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

import { image, sendableImage } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';
const TAG = 'Xts.imageCreateScaledPixelMap'

async function createPixelMapTest(context : Context):Promise<image.PixelMap> {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
    console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
    return pixelMap;
}

async function createSendAblePixelMapTest(context : Context):Promise<sendableImage.PixelMap> {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
  let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
  console.info(TAG,'Succeeded in creating sendablePixelMap object.',JSON.stringify(sendablePixelMap));
  return sendablePixelMap;
}

 function createPixelMapSUPP(context : Context):image.PixelMap {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

function createSendAblePixelMapSUPP(context : Context):sendableImage.PixelMap {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
  let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
  console.info(TAG,'Succeeded in creating sendablePixelMap object.',JSON.stringify(sendablePixelMap));
  return sendablePixelMap;
}

export default function imageCreateCroppedAndScaledPixelMap() {
  describe('imageCreateCroppedAndScaledPixelMap', () => {
    let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString', '');
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('emptyString');
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001
     * @tc.desc      createCroppedAndScaledPixelMap region cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(null, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600204);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002
     * @tc.desc      createCroppedAndScaledPixelMap region cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(undefined, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600204);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003
     * @tc.desc      createCroppedAndScaledPixelMap region cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(AppStorage.get('emptyString'), scaleX, scaleY,
          image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600204);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004
     * @tc.desc      createCroppedAndScaledPixelMap X cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, null, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005
     * @tc.desc      createCroppedAndScaledPixelMap X cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, undefined, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006
     * @tc.desc      createCroppedAndScaledPixelMap X cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, AppStorage.get('emptyString'), scaleY,
          image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_007
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_007
     * @tc.desc      createCroppedAndScaledPixelMap Y cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_007', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_007";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, null, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_008
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_008
     * @tc.desc      createCroppedAndScaledPixelMap Y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_008', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_008";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, undefined, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_009
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_009
     * @tc.desc      createCroppedAndScaledPixelMap Y cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_009', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_009";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, AppStorage.get('emptyString'),
          image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001
     * @tc.desc      createCroppedAndScaledPixelMapSync region cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(null, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600204);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002
     * @tc.desc      createCroppedAndScaledPixelMapSync region cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(undefined, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600204);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003
     * @tc.desc      createCroppedAndScaledPixelMapSync region cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(AppStorage.get('emptyString'), scaleX, scaleY,
          image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600204);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004
     * @tc.desc      createCroppedAndScaledPixelMapSync X cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, null, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005
     * @tc.desc      createCroppedAndScaledPixelMapSync X cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, undefined, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006
     * @tc.desc      createCroppedAndScaledPixelMapSync X cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, AppStorage.get('emptyString'), scaleY,
          image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_007
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_007
     * @tc.desc      createCroppedAndScaledPixelMapSync Y cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_007', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_007";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, null, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_008
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_008
     * @tc.desc      createCroppedAndScaledPixelMapSync Y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_008', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_008";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, undefined, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_009
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_009
     * @tc.desc      createCroppedAndScaledPixelMapSync Y cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_009', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_009";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, AppStorage.get('emptyString'),
          image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_CLONE_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_CLONE_001
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_CLONE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_CLONE_001";
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(context);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info('Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_CLONE_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_CLONE_002
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_CLONE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_CLONE_002";
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(context);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info('Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_001
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(context);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info('Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_002
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_CLONE_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(context);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info('Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_001
     * @tc.desc      flip-horizontal cover true vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = true;
      let vertical: boolean = true;
      try {
        await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_002
     * @tc.desc      flip-horizontal cover false vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = false;
      let vertical: boolean = true;
      try {
        await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_003
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_003
     * @tc.desc      flip-horizontal cover true vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = true;
      let vertical: boolean = false;
      try {
        await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_004
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_004
     * @tc.desc      flip-horizontal cover false vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_PROMISE_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = false;
      let vertical: boolean = false;
      try {
        await pixelMapObj.flip(horizontal, vertical);
        console.info('Succeeded clone pixelmap.');
        expect(pixelMapObj != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_001
     * @tc.desc      setMemoryNameSync name cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      try {
        pixelMapObj.setMemoryNameSync("");
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_002
     * @tc.desc      setMemoryNameSync name cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      try {
        pixelMapObj.setMemoryNameSync(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_003
     * @tc.name      SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_003
     * @tc.desc      setMemoryNameSync name cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_SET_MEMORY_NAME_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      try {
        pixelMapObj.setMemoryNameSync(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_001
     * @tc.desc      readPixelsToBuffer cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        const readPixels = await pixelMapObj.readPixelsToBuffer(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_002
     * @tc.desc      readPixelsToBuffer cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        const readPixels = await pixelMapObj.readPixelsToBuffer(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_003
     * @tc.desc      readPixelsToBuffer cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        const readPixels = await pixelMapObj.readPixelsToBuffer(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001
     * @tc.desc      readPixelsToBufferSync cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createSendAblePixelMapSUPP(context);
      try {
        pixelMapObj.readPixelsToBufferSync(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002
     * @tc.desc      readPixelsToBufferSync cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.readPixelsToBufferSync(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003
     * @tc.desc      readPixelsToBufferSync cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003";
      console.info(TAG, `start：${testName}`);
      try {
        let pixelMapObj = await createSendAblePixelMapTest(context);
        pixelMapObj.readPixelsToBufferSync(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_001
     * @tc.desc      writeBufferToPixels cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        const writeBuffer = await pixelMapObj.writeBufferToPixels(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_002
     * @tc.desc      writeBufferToPixels cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        const writeBuffer = await pixelMapObj.writeBufferToPixels(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_003
     * @tc.desc      writeBufferToPixels cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        const writeBuffer = await pixelMapObj.writeBufferToPixels(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_001
     * @tc.desc      writeBufferToPixelsSync cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.writeBufferToPixelsSync(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_002
     * @tc.desc      writeBufferToPixelsSync cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.writeBufferToPixelsSync(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_003
     * @tc.desc      writeBufferToPixelsSync cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.writeBufferToPixelsSync(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_001
     * @tc.desc      opacity cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.opacity(null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_002
     * @tc.desc      opacity cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.opacity(undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_003
     * @tc.desc      opacity cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.opacity(AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_001
     * @tc.desc      opacitySync cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.opacitySync(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_002
     * @tc.desc      opacitySync cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.opacitySync(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_003
     * @tc.desc      opacitySync cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_OPACITY_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.opacitySync(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_001
     * @tc.desc      scale-x cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleY: number = 1.0;
      try {
        let result = await pixelMapObj.scale(null as ESObject, scaleY);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_002
     * @tc.desc      scale-x cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleY: number = 1.0;
      try {
        let result = await pixelMapObj.scale(undefined as ESObject, scaleY);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_003
     * @tc.desc      scale-x cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleY: number = 1.0;
      try {
        let result = await pixelMapObj.scale(AppStorage.get('emptyString') as ESObject, scaleY);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_004
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_004
     * @tc.desc      scale-y cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleX: number = 2.0;
      try {
        let result = await pixelMapObj.scale(scaleX, null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_005
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_005
     * @tc.desc      scale-y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleX: number = 2.0;
      try {
        let result = await pixelMapObj.scale(scaleX, undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_006
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_006
     * @tc.desc      scale-y cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleX: number = 2.0;
      try {
        let result = await pixelMapObj.scale(scaleX, AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_001
     * @tc.desc      scaleSync-x cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleY: number = 1.0;
      try {
        pixelMapObj.scaleSync(null as ESObject, scaleY);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_002
     * @tc.desc      scaleSync-x cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleY: number = 1.0;
      try {
        pixelMapObj.scaleSync(undefined as ESObject, scaleY);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_003
     * @tc.desc      scaleSync-x cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleY: number = 1.0;
      try {
        pixelMapObj.scaleSync(AppStorage.get('emptyString') as ESObject, scaleY);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_004
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_004
     * @tc.desc      scaleSync-y cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleX: number = 2.0;
      try {
        pixelMapObj.scaleSync(scaleX, null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_005
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_005
     * @tc.desc      scaleSync-y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleX: number = 2.0;
      try {
        pixelMapObj.scaleSync(scaleX, undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_006
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_006
     * @tc.desc      scaleSync-y cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SCALE_SYNC_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let scaleX: number = 2.0;
      try {
        pixelMapObj.scaleSync(scaleX, AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_001
     * @tc.desc      translate-x cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateY: number = 10.0;
      try {
        let result = await pixelMapObj.translate(null as ESObject, translateY);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_002
     * @tc.desc      translate-x cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateY: number = 10.0;
      try {
        let result = await pixelMapObj.translate(undefined as ESObject, translateY);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_003
     * @tc.desc      translate-x cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateY: number = 10.0;
      try {
        let result = await pixelMapObj.translate(AppStorage.get('emptyString') as ESObject, translateY);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_004
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_004
     * @tc.desc      translate-y cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateX: number = 10.0;
      try {
        let result = await pixelMapObj.translate(translateX, null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_005
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_005
     * @tc.desc      translate-y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateX: number = 10.0;
      try {
        let result = await pixelMapObj.translate(translateX, undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_006
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_006
     * @tc.desc      translate-y cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateX: number = 10.0;
      try {
        let result = await pixelMapObj.translate(translateX, AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_001
     * @tc.desc      translateSync-x cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateY: number = 10.0;
      try {
        pixelMapObj.translateSync(null as ESObject, translateY);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_002
     * @tc.desc      translateSync-x cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateY: number = 10.0;
      try {
        pixelMapObj.translateSync(undefined as ESObject, translateY);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_003
     * @tc.desc      translateSync-x cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateY: number = 10.0;
      try {
        pixelMapObj.translateSync(AppStorage.get('emptyString') as ESObject, translateY);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_004
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_004
     * @tc.desc      translateSync-y cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateX: number = 10.0;
      try {
        pixelMapObj.translateSync(translateX, null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_005
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_005
     * @tc.desc      translateSync-y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateX: number = 10.0;
      try {
        pixelMapObj.translateSync(translateX, undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_006
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_006
     * @tc.desc      translateSync-y cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_TRANSLATE_SYNC_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      let translateX: number = 10.0;
      try {
        pixelMapObj.translateSync(translateX, AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_001
     * @tc.desc      rotate cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.rotate(null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_002
     * @tc.desc      rotate cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.rotate(undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_003
     * @tc.desc      rotate cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.rotate(AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_001
     * @tc.desc      rotateSync cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.rotateSync(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_002
     * @tc.desc      rotateSync cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.rotateSync(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_003
     * @tc.desc      rotateSync cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_ROTATE_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.rotateSync(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_001
     * @tc.desc      flip-horizontal cover false vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = false;
        let vertical: boolean = false;
        let result = await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_002
     * @tc.desc      flip-horizontal cover false vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = false;
        let vertical: boolean = true;
        let result = await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_003
     * @tc.desc      flip-horizontal cover true vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = true;
        let vertical: boolean = true;
        let result = await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_004
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_004
     * @tc.desc      flip-horizontal cover true vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = true;
        let vertical: boolean = false;
        let result = await pixelMapObj.flip(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_001
     * @tc.desc      flipSync-horizontal cover false vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = false;
        let vertical: boolean = false;
        pixelMapObj.flipSync(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_002
     * @tc.desc      flipSync-horizontal cover false vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = false;
        let vertical: boolean = true;
        pixelMapObj.flipSync(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_003
     * @tc.desc      flipSync-horizontal cover true vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = true;
        let vertical: boolean = true;
        pixelMapObj.flipSync(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_004
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_004
     * @tc.desc      flipSync-horizontal cover true vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_FLIP_SYNC_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let horizontal: boolean = true;
        let vertical: boolean = false;
        pixelMapObj.flipSync(horizontal, vertical);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_001
     * @tc.desc      flip-horizontal cover true vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = true;
      let vertical: boolean = true;
      try {
        pixelMapObj.flip(horizontal, vertical, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to flip pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, "Succeeded in flipping pixelmap.");
            expect(pixelMapObj != undefined).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_002
     * @tc.desc      flip-horizontal cover false vertical cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = false;
      let vertical: boolean = true;
      try {
        pixelMapObj.flip(horizontal, vertical, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to flip pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, "Succeeded in flipping pixelmap.");
            expect(pixelMapObj != undefined).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_003
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_003
     * @tc.desc      flip-horizontal cover true vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = true;
      let vertical: boolean = false;
      try {
        pixelMapObj.flip(horizontal, vertical, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to flip pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, "Succeeded in flipping pixelmap.");
            expect(pixelMapObj != undefined).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_004
     * @tc.name      SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_004
     * @tc.desc      flip-horizontal cover false vertical cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_FLIP_CALLBACK_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      let horizontal: boolean = false;
      let vertical: boolean = false;
      try {
        pixelMapObj.flip(horizontal, vertical, (err: BusinessError) => {
          if (err) {
            console.error(TAG, `Failed to flip pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, "Succeeded in flipping pixelmap.");
            expect(pixelMapObj != undefined).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_001
     * @tc.desc      crop cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.crop(null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_002
     * @tc.desc      crop cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.crop(undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_003
     * @tc.desc      crop cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.crop(AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001
     * @tc.desc      cropSync cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.cropSync(null as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002
     * @tc.desc      cropSync cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.cropSync(undefined as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003
     * @tc.desc      cropSync cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.cropSync(AppStorage.get('emptyString') as ESObject);
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_GET_COLORSPACE_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_GET_COLORSPACE_001
     * @tc.desc      getColorSpace cover 62980103
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_GET_COLORSPACE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_GET_COLORSPACE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = pixelMapObj.getColorSpace();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980103);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_001
     * @tc.desc      setColorSpace cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.setColorSpace(null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980115);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_002
     * @tc.desc      setColorSpace cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {

        pixelMapObj.setColorSpace(undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980115);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_003
     * @tc.desc      setColorSpace cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_SET_COLORSPACE_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.setColorSpace(AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980115);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_001
     * @tc.desc      applyColorSpace cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.applyColorSpace(null as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_002
     * @tc.desc      applyColorSpace cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.applyColorSpace(undefined as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_003
     * @tc.desc      applyColorSpace cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MAP_APPLY_COLORSPACE_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.applyColorSpace(AppStorage.get('emptyString') as ESObject);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_001
     * @tc.desc      marshalling cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.marshalling(null as ESObject)
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_002
     * @tc.desc      marshalling cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.marshalling(undefined as ESObject)
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_003
     * @tc.desc      marshalling cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_MARSHALLING_TEST_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        pixelMapObj.marshalling(AppStorage.get('emptyString') as ESObject)
        expect(pixelMapObj != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_001
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_001
     * @tc.desc      unmarshalling cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.unmarshalling(null as ESObject)
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980096);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_002
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_002
     * @tc.desc      unmarshalling cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.unmarshalling(undefined as ESObject)
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980096);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_003
     * @tc.name      SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_003
     * @tc.desc      unmarshalling cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_PIXEL_UNMARSHALLING_TEST_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let result = await pixelMapObj.unmarshalling(AppStorage.get('emptyString') as ESObject)
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980096);
        done();
      }
    });
  });
}