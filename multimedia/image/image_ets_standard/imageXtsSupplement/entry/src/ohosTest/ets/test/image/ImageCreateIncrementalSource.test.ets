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

const TAG = LOG_TAG + 'createIncrementalSource';

async function createIncrementalSourceBufOptionsAbnormalTest(done: Function, testName: string, buf: ArrayBuffer,
  SourceOptions: image.SourceOptions, callback: (data: image.ImageSource) => void) {
  try {
    const imageSourceApi: image.ImageSource = image.CreateIncrementalSource(buf, SourceOptions);
    callback(imageSourceApi)
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},code:${error.code}`);
    expect().assertFail();
    done();
  }
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ', maxValue);
  return maxValue;
}

export default function ImageCreateIncrementalSourceTest() {
  describe('ImageCreateIncrementalSourceTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0001
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0001';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: null as ESObject
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0002
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0002';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: undefined as ESObject
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0003
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0003';
      let buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('keys', '');
      let sourceOptions: image.SourceOptions = {
        sourceDensity: AppStorage.get('keys') as ESObject
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0004
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0004';
      let buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('keys', []);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: AppStorage.get('keys') as ESObject
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0005
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0005';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0006
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0006
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0006';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1000,
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0007
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0007
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0007';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0008
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0008
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0008';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
        sourceSize: {
          width: 100,
          height: 100
        }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0009
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0009
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0009';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: -1
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0010
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0010
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0010';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: getEnumMaxValue(image.PixelMapFormat) + 1
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0011
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0011
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0011';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: 1103
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0012
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0012
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0012';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: undefined
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0013
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0013
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0013';
      let buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: null as ESObject
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0014
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0014
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0014';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: null as ESObject, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0015
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0015
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0015';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: undefined as ESObject, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0016
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0016
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0016';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: -1, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0017
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0017
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0017';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100000000, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0018
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0018
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0018';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: 100000000 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0019
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0019
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0019';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: -1000, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0020
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0020
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0020';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: null as ESObject }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0021
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0021
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0021';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: undefined as ESObject }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0022
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0022
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0022';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: -1 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0023
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0023
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0023';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: -1000 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0024
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0024
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0024';
      const buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('key', '');
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: AppStorage.get('key') as ESObject, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0025
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0025
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0025';
      const buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('key', '');
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: AppStorage.get('key') as ESObject }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0026
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0026
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0026';
      const buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('key', [-1, 0, 1]);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: AppStorage.get('key') as ESObject, width: 100 }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0027
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0027
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0027';
      const buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('key', [-1, 0, 1]);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: { height: 100, width: AppStorage.get('key') as ESObject }
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0028
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0028
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0028';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: null as ESObject
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0029
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0029
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0029';
      const buf = new ArrayBuffer(1024);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: undefined
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0030
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0030
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0030';
      const buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('key', [-1, 0, 1]);
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: AppStorage.get('key')
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0031
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0031
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_ABNORMAL_0031';
      const buf = new ArrayBuffer(1024);
      AppStorage.setOrCreate('key', '123');
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 120,
        sourceSize: AppStorage.get('key')
      };
      await createIncrementalSourceBufOptionsAbnormalTest(done, testName, buf, sourceOptions,
        (data: image.ImageSource) => {
          expect(data).not().assertUndefined();
        });
    });
  })
}