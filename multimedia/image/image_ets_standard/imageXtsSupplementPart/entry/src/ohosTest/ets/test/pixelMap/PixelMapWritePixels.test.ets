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
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'pixelMapWritePixels';

async function writePixelsNormalTest(done: Function, testName: string, pixelMap: image.PixelMap,
  area: image.PositionArea, callback: (data: BusinessError<void>) => void) {
  try {
    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    pixelMap.writePixels(area, (error) => {
      if (error) {
        console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
        callback(error);
      }
      done();
    });
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function writePixelsAbnormalTest(done: Function, testName: string, pixelMap: image.PixelMap,
  area: image.PositionArea, errorCallback: (data: string) => void) {
  try {
    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    pixelMap.writePixels(area, (error) => {
      if (error) {
        console.info(TAG, testName, `Failed; error: ${error} code is ${error.code}, message is ${error.message}`);
        errorCallback(JSON.stringify(error));
      } else {
        console.info(TAG, testName, 'RGBA data is ', new Uint8Array(area.pixels));
        expect().assertFail();
      }
      done();
    });
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getArrayBufferByUri(pathUri: string): Promise<ArrayBuffer> {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let array = new ArrayBuffer(110000);
  let path = `file://${testContext.filesDir}/${pathUri}`;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  console.info(TAG, `readLength: ${readLength}`);
  return array;
}

export default function pixelMapWritePixelsTest() {
  describe('pixelMapWritePixelsTest', () => {

    const testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

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
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0001
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0001
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0001', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0001";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0002
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0002
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0002', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0002";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(20),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0003
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0003
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0003', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0003";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0004
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0004
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0004', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0004";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 4,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0005
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0005
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0005', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0005";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: -1,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0006
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0006
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0006', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0006";
      let color: ArrayBuffer = new ArrayBuffer(8);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0007
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0007
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0007', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0007";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0008
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0008
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0008', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0008";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 20000, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0009
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0009
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0009', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0009";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(3000),
        offset: 0,
        stride: 40000,
        region: { size: { height: 2, width: 20000 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0010
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0010
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0010', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0010";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 10000000, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0011
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0011
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0011', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0011";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 10000000 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0012
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0012
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0012', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0012";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: -1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0013
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0013
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0013', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0013";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: -1 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0014
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0014
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0014', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0014";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: -1, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0015
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0015
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0015', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0015";
      let color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: -1 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0016
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0016
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0016', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0016";
      let color = new ArrayBuffer(36);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0017
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0017
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0017', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0017";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(20),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0018
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0018
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0018', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0018";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(4),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0019
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0019
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0019', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0019";
      let color: ArrayBuffer = new ArrayBuffer(4);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(9),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0020
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0020
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0020', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0020";
      let color: ArrayBuffer = new ArrayBuffer(6);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0021
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0021
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0021', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0021";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0022
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0022
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0022', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0022";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0023
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0023
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0023', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0023";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(18),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0024
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0024
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0024', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0024";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(14),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0025
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0025
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0025', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0025";
      let color: ArrayBuffer = new ArrayBuffer(14);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(24),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0026
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0026
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0026', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0026";
      let array = await getArrayBufferByUri('test_exif_v2.jpg');
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let imageSourceApi = image.createImageSource(array);
      let pixelMap: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0027
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0027
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0027', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0027";
      let array = await getArrayBufferByUri('test_exif_v2.jpg');
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let imageSourceApi = image.createImageSource(array);
      let pixelMap: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(18),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0028
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0028
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0028', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0028";
      let array = await getArrayBufferByUri('test_exif_v2.jpg');
      let decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      let imageSourceApi = image.createImageSource(array);
      let pixelMap: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(14),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0029
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0029
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0029', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0029";
      let color = new ArrayBuffer(36);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0030
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0030
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0030', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0030";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(10),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0031
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0031
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0031', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0031";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(4),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0032
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0032
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0032', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0032";
      let color: ArrayBuffer = new ArrayBuffer(4);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 1, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(9),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0033
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0033
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0033', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0033";
      let color: ArrayBuffer = new ArrayBuffer(6);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(6),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0034
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0034
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0034', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0034";
      let color = new ArrayBuffer(36);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0035
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0035
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0035', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0035";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(18),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0036
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0036
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0036', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0036";
      let color = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(14),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0037
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0037
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0037', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0037";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(24),
        offset: 0,
        stride: 8,
        region: { size: { height: 3, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalTest(done, testName, pixelMap, area, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0038
     * @tc.number SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0038
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0038', Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_PIXEL_MAP_WRITE_PIXELS_ASYNC_CALLBACK_0038";
      let color: ArrayBuffer = new ArrayBuffer(16);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 2, width: 2 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let area: image.PositionArea = {
        pixels: new ArrayBuffer(16),
        offset: 0,
        stride: 8,
        region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsNormalTest(done, testName, pixelMap, area, (data: BusinessError<void>) => {
        expect(data).assertUndefined();
      });
    })
  })
}