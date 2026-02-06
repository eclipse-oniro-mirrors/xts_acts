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

import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import fs from '@ohos.file.fs';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';

const TAG = 'xts.CreateImageSourceSuppTest';

async function createImageSourceFdPromiseTest(done: Function, testName: string, pathUri: string,
  callback: (errCode: image.ImageInfo) => void, SourceOptions?: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    let file = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    console.error(TAG, testName, JSON.stringify(SourceOptions));
    let imageSourceApi: image.ImageSource =
      SourceOptions ? image.createImageSource(file.fd, SourceOptions!) : image.createImageSource(file.fd);
    console.info(TAG, testName, ` success: `, JSON.stringify(imageSourceApi.getImageInfoSync()), JSON.stringify(file));
    callback(imageSourceApi.getImageInfoSync());
    done();
  } catch (error) {
    console.error(TAG, testName, ` failed; error:`, JSON.stringify(error), error.code);
    expect().assertFail();
    done();
  }
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export default function CreateImageSourceSuppTest() {
  describe('CreateImageSourceSuppTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testArray', [-1, 0, 1]);
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
    });

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0001
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0001
     * @tc.desc   Test createImageSource with UNKNOWN pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0001';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0002
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0002
     * @tc.desc   Test createImageSource with ARGB_8888 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0002';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0003
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0003
     * @tc.desc   Test createImageSource with RGB_565 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0003';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0004
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0004
     * @tc.desc   Test createImageSource with RGBA_8888 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0004';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0005
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0005
     * @tc.desc   Test createImageSource with BGRA_8888 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0005';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0006
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0006
     * @tc.desc   Test createImageSource with RGB_888 pixel format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0006';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_888,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0007
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0007
     * @tc.desc   Test createImageSource with RGBA_F16 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0007';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0008
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0008
     * @tc.desc   Test createImageSource with NV21 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0008';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0009
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0009
     * @tc.desc   Test createImageSource with NV12 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0009';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.NV12,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0010
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0010
     * @tc.desc   Test createImageSource with RGBA_1010102 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0010';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0011
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0011
     * @tc.desc   Test createImageSource with YCBCR_P010 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0011';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0012
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0012
     * @tc.desc   Test createImageSource with YCRCB_P010 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0012';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.YCRCB_P010,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0013
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0013
     * @tc.desc   Test createImageSource with ASTC_4x4 pixel format on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0013';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
        sourceDensity: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0014
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0014
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0014';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0015
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0015
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0015';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0016
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0016
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0016';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0017
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0017
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0017';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0018
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0018
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0018';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0019
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0019
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0019';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.RGB_888,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0020
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0020
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0020';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0021
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0021
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0021';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0022
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0022
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0022';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.NV21,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0023
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0023
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0023';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.NV12,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0024
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0024
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0024';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0025
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0025
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0025';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0026
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0026
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0026';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.YCRCB_P010,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0027
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0027
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0027';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })


    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0028
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0028
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0028';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: -1,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0029
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0029
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0029';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: -1000,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0030
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0030
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0030';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: null as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0031
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0031
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0031';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: undefined as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0032
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0032
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0032';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: AppStorage.get('testArray') as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0033
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0033
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0033';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: AppStorage.get('testString') as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0034
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0034
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0034', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0034';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: 1000,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0035
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0035
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0035', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0035';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: -1,
          width: 100
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0036
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0036
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0036', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0036';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: -1000,
          width: 100
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0037
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0037
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0037', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0037';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: null as ESObject,
          width: 100
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0038
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0038
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0038', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0038';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: undefined as ESObject,
          width: 100
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0039
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0039
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0039', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0039';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: AppStorage.get('testString') as ESObject,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0040
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0040
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0040';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: AppStorage.get('testArray') as ESObject,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0041
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0041
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0041', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0041';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: -1
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0042
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0042
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0042', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0042';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: -1000
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0043
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0043
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0043', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0043';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: null as ESObject
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0044
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0044
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0044', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0044';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: undefined as ESObject
        },
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0045
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0045
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0045', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0045';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: AppStorage.get('testString') as ESObject
        },
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0046
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0046
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0046', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0046';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: AppStorage.get('testArray') as ESObject,
        },
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0047
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0047
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0047', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0047';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: 100
        },
        sourcePixelFormat: -1,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0048
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0048
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0048', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0048';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: -100,
          width: 100
        },
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0049
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0049
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0049', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0049';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: 100,
          width: -100
        },
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0050
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0050
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0050';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize: {
          height: -100,
          width: -100
        },
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0051
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0051
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0051', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0051';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0052
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0052
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0052', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0052';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: null as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0053
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0053
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0053', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0053';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: undefined as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0054
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0054
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0054', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0054';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: AppStorage.get('testString') as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0055
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0055
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0055', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0055';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: AppStorage.get('testArray') as ESObject,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0056
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0056
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0056', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0056';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0057
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0057
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0057', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0057';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
        sourceSize: {
          width: 100,
          height: 100
        }
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0058
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0058
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0058', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0058';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: -1,
        sourceSize: {
          width: 100,
          height: 100
        }
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0059
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0059
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0059', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0059';
      const path = 'test_tree_400.jpg'
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: 0,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0060
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0060
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0060';
      const path = 'test_tree_400.jpg'
      let maxEnum = getEnumMaxValue(image.PixelMapFormat) + 1;
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourcePixelFormat: maxEnum,
      };
      await createImageSourceFdPromiseTest(done, testName, path, (errCode: image.ImageInfo) => {
        expect(errCode != undefined).assertTrue();
      }, sourceOptions,);
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0100
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0100
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0100', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0100';
      try {
        let res = await image.createImageSource(-1);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0200
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0200
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0200', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0200';
      try {
        let res = await image.createImageSource(-1000);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0300
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0300
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0300', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0300';
      try {
        let res = await image.createImageSource(null as ESObject as number);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0400
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0400
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0400', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0400';
      try {
        let res = await image.createImageSource(undefined as ESObject as number);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0500
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0500
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0500', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0500';
      try {
        let res = await image.createImageSource(AppStorage.get('testString') as number);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0600
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0600
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0600', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0600';
      try {
        let res = await image.createImageSource(AppStorage.get('testArray') as number);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.name   SUB_SENDABLE_CREATE_IMAGE_SOURCE_0700
     * @tc.number SUB_SENDABLE_CREATE_IMAGE_SOURCE_0700
     * @tc.desc   Test createImageSource with Size on .jpg file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_CREATE_IMAGE_SOURCE_0700', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_SENDABLE_CREATE_IMAGE_SOURCE_0700';
      try {
        let res = await image.createImageSource(1000000);
        console.info(TAG, testName, 'success', JSON.stringify(res));
        expect(res == undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, ' failed ', JSON.stringify(err), err.code);
        expect().assertFail();
      } finally {
        done();
      }
    })
  })
}