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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'pixelMapReadPixels';

async function getPixMap(fileName: string, decodingOptions: image.DecodingOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let uri = 'file://' + testContext.filesDir + "/" + fileName;
  let imageSourceApi = image.createImageSource(uri);
  let pixelMap: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
  return pixelMap;
}

async function readPixelsPromiseTest(done: Function, testName: string, pixelMap: image.PixelMap,
  area: image.PositionArea, callback: (data: ArrayBuffer) => void) {
  try {
    if (pixelMap != undefined) {
      pixelMap.readPixels(area, (error) => {
        if (error) {
          console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        } else {
          console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
          callback(area.pixels);
        }
        done();
      })
    }
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
    done();
  }
}

async function readPixelsAbnormalPromiseTest(done: Function, testName: string, pixelMap: image.PixelMap,
  area: image.PositionArea, errorCallback: (data: string) => void) {
  try {
    if (pixelMap != undefined) {
      pixelMap.readPixels(area, (error) => {
        if (error) {
          console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
          errorCallback(JSON.stringify(error));
        } else {
          console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
          expect().assertFail();
        }
        done();
      })
    }
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
    done();
  }
}

export default function pixelMapReadPixelsTest() {
  describe('pixelMapReadPixelsTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0001
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0001
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0001', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0001";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0002
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0002
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0002', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0002";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 6,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0003
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0003
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0003', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0003";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(20);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0004
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0004
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0004', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0004";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(4);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0005
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0005
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0005', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0005";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 80000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0006
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0006
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0006', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0006";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0007
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0007
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0007', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0007";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0008
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0008
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0008', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0008";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0009
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0009
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0009', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0009";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0010
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0010
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0010', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0010";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(600);
      const area: image.PositionArea = {
        pixels: array,
        offset: 100,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0011
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0011
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0011', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0011";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(60);
      const area: image.PositionArea = {
        pixels: array,
        offset: 100,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0012
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0012
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0012', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0012";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(2);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0013
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0013
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0013', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0013";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(10);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0014
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0014
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0014', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0014";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(600000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 800000,
        region: { size: { height: 2, width: 200000 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0015
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0015
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0015', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0015";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0016
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0016
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0016', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0016";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0017
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0017
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0017', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0017";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: -1,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0018
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0018
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0018', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0018";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: -1,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0019
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0019
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0019', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0019";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: -1, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0020
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0020
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0020', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0020";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: -1 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0021
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0021
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0021', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0021";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: -1, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0022
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0022
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0022', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0022";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(6);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: -1 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0023
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0023
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0023', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0023";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0024
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0024
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0024', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0024";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 6,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0025
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0025
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0025', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0025";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(20);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0026
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0026
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0026', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0026";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(4);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0027
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0027
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0027', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0027";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 80000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0028
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0028
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0028', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0028";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0029
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0029
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0029', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0029";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0030
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0030
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0030', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0030";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0031
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0031
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0031', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0031";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0032
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0032
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0032', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0032";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 6,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0033
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0033
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0033', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0033";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(20);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0034
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0034
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0034', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0034";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(4);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0035
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0035
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0035', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0035";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 80000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0036
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0036
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0036', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0036";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0037
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0037
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0037', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0037";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0038
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0038
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0038', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0038";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0039
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0039
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0039', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0039";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0040
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0040
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0040', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0040";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(15);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0041
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0041
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0041', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0041";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(10);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0042
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0042
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0042', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0042";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(4);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0043
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0043
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0043', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0043";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(20);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0044
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0044
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0044', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0044";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 6,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0045
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0045
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0045', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0045";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 0,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0046
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0046
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0046', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0046";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0047
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0047
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0047', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0047";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 80000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0048
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0048
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0048', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0048";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0049
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0049
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0049', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0049";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0050
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0050
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0050', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0050";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0051
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0051
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0051', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0051";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0052
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0052
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0052', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0052";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 6,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0053
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0053
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0053', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0053";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(20);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, pixelMap, area, (data: ArrayBuffer) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0054
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0054
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0054', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0054";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(14);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0055
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0055
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0055', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0055";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 80000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0056
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0056
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0056', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0056";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0057
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0057
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0057', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0057";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(16);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0058
     * @tc.number SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0058
     * @tc.desc   readPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0058', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_READ_PIXELS_0058";
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
      };
      let pixelMap: image.PixelMap = await getPixMap("test_exif_v2.jpg", decodingOptions);
      let array: ArrayBuffer = new ArrayBuffer(3000);
      const area: image.PositionArea = {
        pixels: array,
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })
  })
}