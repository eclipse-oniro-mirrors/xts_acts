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

const TAG = LOG_TAG + 'createImageSource';

async function createImageSourceAbnormaTest(done: Function, testName: string, buf: ArrayBuffer,
  callback: (imageSourceApi: image.ImageSource) => void,
  SourceOptions?: image.SourceOptions) {
  try {
    const imageSourceApi: image.ImageSource =
      SourceOptions ? image.createImageSource(buf, SourceOptions) : image.createImageSource(buf);
    console.info(TAG, `imageSourceApi ： `, imageSourceApi);
    callback(imageSourceApi);
    done();
  } catch (error) {
    console.error(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreateImageSourceOptionsTest() {
  describe('ImageCreateImageSourceOptionsTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('keyString', 'abc')
      AppStorage.setOrCreate('keyMap', [])

      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('keyString')
      AppStorage.delete('keyMap')
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_0001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_001
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_0001';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: null as ESObject,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_002
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_002';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: undefined as ESObject,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_003
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_003';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: -1,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_004
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_004';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: -100,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_005
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_005';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: AppStorage.get('keyString') as ESObject,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_006
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_006
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_006';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: AppStorage.get('keyMap') as ESObject,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_007
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_007
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_007';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: 120,
          sourcePixelFormat: null as ESObject,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_008
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_008
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_008';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: 120,
          sourcePixelFormat: undefined as ESObject,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_009
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_009
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_009';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: 120,
          sourcePixelFormat: -1,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_010
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_010
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_010';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: 120,
          sourcePixelFormat: -202,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_011
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_011
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_011';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: 120,
          sourcePixelFormat: AppStorage.get('keyString') as ESObject,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_012
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_012
     * @tc.desc   Test createImageReceiver with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_012';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions =
        {
          sourceDensity: 120,
          sourcePixelFormat: AppStorage.get('keyMap') as ESObject,
          sourceSize: { width: 100, height: 100 }
        };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_013
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_013
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_013';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: { width: -1, height: 100 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_014
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_014
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_014';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: { width: -1000, height: 100 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_015
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_015
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_015';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: null as ESObject, height: 100 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_016
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_016
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_016';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: undefined as ESObject, height: 100 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_017
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_017
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_017';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: AppStorage.get('keyString') as ESObject, height: 100 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_018
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_018
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_018';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: AppStorage.get('keyMAp') as ESObject, height: 100 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_019
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_019
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_019';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: { width: 100, height: -1 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_020
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_020
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_020';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: { width: 100, height: -1000 } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_021
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_021
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_021';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: 100, height: null as ESObject } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_022
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_022
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_022';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: 100, height: undefined as ESObject } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_023
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_023
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_023';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: 100, height: AppStorage.get('keyString') as ESObject } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_024
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_024
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_024';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: { width: 100, height: AppStorage.get('keyMap') as ESObject } };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_025
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_025
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_025';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: undefined as ESObject };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_026
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_026
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_026';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: null as ESObject };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_027
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_027
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_027';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120, sourceSize: AppStorage.get('keyMap') as ESObject };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_028
     * @tc.number SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_028
     * @tc.desc   Test createImageReceiver with size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_IMAGE_SOURCE_ABNORMAL_ERROR_028';
      const buf: ArrayBuffer = new ArrayBuffer(112);
      let sourceOptions: image.SourceOptions =
        { sourceDensity: 120, sourceSize: AppStorage.get('keyString') as ESObject };
      await createImageSourceAbnormaTest(done, testName, buf, (imageSourceApi) => {
        expect(imageSourceApi).not().assertUndefined()
      }, sourceOptions);
    })
  })
}