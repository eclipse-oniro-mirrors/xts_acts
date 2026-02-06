/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import ndkTest from 'libentry.so'
import { camera } from '@kit.CameraKit';
import { common } from '@kit.AbilityKit';

const IMAGE_SUCCESS = 0;
const CALLBACK_FUC_DE = -1;
const CALLBACK_FUC_01 = 1;
const CALLBACK_FUC_02 = 2;
const CALLBACK_FUC_03 = 3;
const CALLBACK_FUC_04 = 4;

const PARA_ERROR_CODE = 7900201;

interface pixelMapPots {
  width: number,
  height: number,
  pixelFormat: number,
  editable: number,
  alphaType: number,
  scaleMode: number
}

let opts: pixelMapPots = {
  width: 4,
  height: 6,
  pixelFormat: 4,
  editable: 1,
  alphaType: 0,
  scaleMode: 1
};

export default function ImagePixelMapNDKTest() {
  describe('ImagePixelMapNDKTest', () => {
    let globalpixelmap: image.PixelMap;

    let sleep = (ms: number): Promise<void> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0100
     * @tc.desc   OH_PixelMap_CreatePixelMap return error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0100', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.createPixelMapSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0200
     * @tc.desc   OH_PixelMap_CreatePixelMap returns error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_CREATEPIXELMAP_0200', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.createPixelMapThirdpartSkiaError(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    // 补充
    /**
     * @tc.name   PixelMapCreatePixelMapResultSuccess001
     * @tc.number SUB_PIXELMAPCREATEPIXELMAPRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPCREATEPIXELMAPRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapCreatePixelMapResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapCreatePixelMapResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapGetBytesNumberPerRowResultSuccess001
     * @tc.number SUB_PIXELMAPGETBYTESNUMBERPERROWRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPGETBYTESNUMBERPERROWRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapGetBytesNumberPerRowResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapGetBytesNumberPerRowResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapGetIsEditableResultSuccess001
     * @tc.number SUB_PIXELMAPGETISEDITABLERESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPGETISEDITABLERESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapGetIsEditableResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapGetIsEditableResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapIsSupportAlphaResultSuccess001
     * @tc.number SUB_PIXELMAPISSUPPORTALPHARESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPISSUPPORTALPHARESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapIsSupportAlphaResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapIsSupportAlphaResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapSetAlphaAbleResultSuccess001
     * @tc.number SUB_PIXELMAPSETALPHAABLERESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPSETALPHAABLERESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapSetAlphaAbleResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapSetAlphaAbleResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapGetDensityResultSuccess001
     * @tc.number SUB_PIXELMAPGETDENSITYRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPGETDENSITYRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapGetDensityResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapGetDensityResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapSetOpacityResultSuccess001
     * @tc.number SUB_PIXELMAPSETOPACITYRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPSETOPACITYRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapSetOpacityResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapSetOpacityResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapScaleResultSuccess001
     * @tc.number SUB_PIXELMAPSCALERESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPSCALERESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapScaleResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapScaleResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapScaleWithAntiAliasingResultSuccess001
     * @tc.number SUB_PIXELMAPSCALEWITHANTIALIASINGRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPSCALEWITHANTIALIASINGRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapScaleWithAntiAliasingResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapScaleWithAntiAliasingResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapTranslateResultSuccess001
     * @tc.number SUB_PIXELMAPTRANSLATERESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPTRANSLATERESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapTranslateResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapTranslateResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapRotateResultSuccess001
     * @tc.number SUB_PIXELMAPROTATERESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPROTATERESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapRotateResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapRotateResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapFlipResultSuccess001
     * @tc.number SUB_PIXELMAPFLIPRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPFLIPRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapFlipResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapFlipResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapCropResultSuccess001
     * @tc.number SUB_PIXELMAPCROPRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPCROPRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapCropResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapCropResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapGetImageInfoResultSuccess001
     * @tc.number SUB_PIXELMAPGETIMAGEINFORESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPGETIMAGEINFORESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapGetImageInfoResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapGetImageInfoResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapAccessPixelsResultSuccess001
     * @tc.number SUB_PIXELMAPACCESSPIXELSRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPACCESSPIXELSRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapAccessPixelsResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapAccessPixelsResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapUnAccessPixelsResultSuccess001
     * @tc.number SUB_PIXELMAPUNACCESSPIXELSRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPUNACCESSPIXELSRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapUnAccessPixelsResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapUnAccessPixelsResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });
    /**
     * @tc.name   PixelMapSetDensityResultSuccess001
     * @tc.number SUB_PIXELMAPSETDENSITYRESULTSUCCESS_0100
     * @tc.desc   test PIXELMAPSETDENSITYRESULTSUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PixelMapSetDensityResultSuccess001', Level.LEVEL3, async (done: Function) => {
      const color = new ArrayBuffer(96);
      let res: number = ndkTest.PixelMapSetDensityResultSuccess(color, opts);
      expect(res).assertEqual(0);

      done()
    });

  })
}