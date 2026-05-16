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
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'pixelMapGetBytesNumberPerRowTest';

async function getBytesNumberPerRowTest(done: Function, testName: string, array: ArrayBuffer,
  options: image.InitializationOptions,
  callback: (data: number) => void) {
  console.info(TAG, testName, "getBytesNumberPerRowTest start");
  try {
    let pixelMap = await image.createPixelMap(array, options);
    console.info(TAG, testName, "createPixelMap success");
    let rowCount: number = pixelMap.getBytesNumberPerRow();
    console.info(TAG, testName, `rowCount: ${rowCount}`);
    callback(rowCount);
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},code:${error.code}`);
    expect().assertFail();
    done();
  }
}

async function getArrayBufferByUri(testContext: common.UIAbilityContext, pathUri: string): Promise<ArrayBuffer> {
  let array = new ArrayBuffer(3000);
  let path = `file://${testContext.filesDir}/${pathUri}`;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  console.info(TAG, `readLength: ${readLength}`);
  return array;
}

export default function pixelMapGetBytesNumberPerRowTest() {
  describe('pixelMapGetBytesNumberPerRowTest', () => {

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
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0001
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0001
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0001';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0002
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0002
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0002';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0003
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0003
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0003';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0004
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0004
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0004';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0005
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0005
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0005';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0006
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0006
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0006';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0007
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0007
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0007';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0008
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0008
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0008';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0009
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0009
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0009';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0010
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0010
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0010';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0011
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0011
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0011';
      let array: ArrayBuffer = new ArrayBuffer(96);
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0012
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0012
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0012';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0013
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0013
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0013';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0014
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0014
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0014';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0015
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0015
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0015';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0016
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0016
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0016';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0017
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0017
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0017';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0018
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0018
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0018';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0019
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0019
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0019';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0020
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0020
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0020';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0021
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0021
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0021';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0022
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0022
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0022';
      let array = await getArrayBufferByUri(testContext, 'test.jpg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0023
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0023
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0023';
      let array = await getArrayBufferByUri(testContext, 'test.png');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0024
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0024
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0024';
      let array = await getArrayBufferByUri(testContext, 'test.123');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0025
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0025
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0025';
      let array = await getArrayBufferByUri(testContext, 'test.arw');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0026
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0026
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0026';
      let array = await getArrayBufferByUri(testContext, 'test.cr2');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0027
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0027
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0027';
      let array = await getArrayBufferByUri(testContext, 'test.cr3');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0028
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0028
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0028';
      let array = await getArrayBufferByUri(testContext, 'test.ico');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0029
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0029
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0029';
      let array = await getArrayBufferByUri(testContext, 'test.jpeg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0030
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0030
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0030';
      let array = await getArrayBufferByUri(testContext, 'test.nrw');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0031
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0031
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0031';
      let array = await getArrayBufferByUri(testContext, 'test.svg');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0032
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0032
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0032';
      let array = await getArrayBufferByUri(testContext, 'test.webp');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0033
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0033
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0033';
      let array = await getArrayBufferByUri(testContext, 'test8.bmp');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0034
     * @tc.number SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0034
     * @tc.desc   getBytesNumberPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXEL_MAP_GET_BYTES_NUMBER_PER_ROW_0034';
      let array = await getArrayBufferByUri(testContext, 'test_dng.dng');
      let options: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await getBytesNumberPerRowTest(done, testName, array, options, (data: number) => {
        expect(data).not().assertUndefined();
      });
    })

  })
}