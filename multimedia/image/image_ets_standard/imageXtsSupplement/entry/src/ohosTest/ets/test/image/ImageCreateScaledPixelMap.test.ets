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

import { image } from '@kit.ImageKit';
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
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        await pixelMapObj.createCroppedAndScaledPixelMap(AppStorage.get('emptyString'), scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        await pixelMapObj.createCroppedAndScaledPixelMap(region, AppStorage.get('emptyString'), scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, AppStorage.get('emptyString'), image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        pixelMapObj.createCroppedAndScaledPixelMapSync(AppStorage.get('emptyString'), scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, AppStorage.get('emptyString'), scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code);
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
        console.error(TAG,testName,error,error.code);
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
      let pixelMapObj =  createPixelMapSUPP(context);
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
        console.error(TAG,testName,error,error.code);
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
      let pixelMapObj =  createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, AppStorage.get('emptyString'), image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code);
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
        let newPixelMap =  PixelMap.cloneSync();
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
        let newPixelMap =  PixelMap.cloneSync();
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
        await pixelMapObj.flip(horizontal,vertical);
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
        await pixelMapObj.flip(horizontal,vertical);
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
        await pixelMapObj.flip(horizontal,vertical);
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
        await pixelMapObj.flip(horizontal,vertical);
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
  });
};

