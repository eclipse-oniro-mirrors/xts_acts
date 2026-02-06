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
import { copyImageToSandbox, genRandomStr } from '../../common';
import fs from '@ohos.file.fs';
import { resourceManager } from '@kit.LocalizationKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createImageSource';

async function createImageSourcePromiseTest(done: Function, testName: string, pathUri: string,
  SourceOptions?: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    console.log(JSON.stringify(imageSourceApi))
    let imageInfo = await imageSourceApi.createPixelMap();
    console.log(TAG, JSON.stringify(imageInfo), JSON.stringify(imageInfo.getImageInfoSync().size.height));
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageSourceFdPromiseTest(done: Function, testName: string, pathUri: string,
  SourceOptions?: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path ='file://' + testContext.filesDir + "/" + pathUri;
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    const imageSourceApi: image.ImageSource =
      SourceOptions ? image.createImageSource(file.fd, SourceOptions) : image.createImageSource(file.fd);
    let imageInfo = await imageSourceApi.createPixelMap();
    console.log(TAG, JSON.stringify(imageInfo), JSON.stringify(imageInfo.getImageInfoSync().size.height))
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageSourceBufPromiseTest(done: Function, testName: string, buf: ArrayBuffer,
  SourceOptions?: image.SourceOptions) {
  try {
    const imageSourceApi: image.ImageSource =
      SourceOptions ? image.createImageSource(buf, SourceOptions) : image.createImageSource(buf);
    expect(JSON.stringify(imageSourceApi) != undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageSourceRawfilePromiseTest(done: Function, testName: string, path: string,
  SourceOptions?: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
    let rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(path)
    const imageSourceApi: image.ImageSource =
      SourceOptions ? image.createImageSource(rawFileDescriptor, SourceOptions) :
      image.createImageSource(rawFileDescriptor);
    expect(imageSourceApi !== undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, JSON.stringify(error), testName);
    expect().assertFail();
    done();
  }
}

export default function createImageSourceTest() {
  describe('createImageSourceTest', () => {

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
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_001
     * @tc.name      : createImageSource_promise_001
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_002
     * @tc.name      : createImageSource_promise_002
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_002';
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_003
     * @tc.name      : createImageSource_promise_003
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_003';
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_004
     * @tc.name      : createImageSource_promise_004
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_004';
      const fileName = 'test_exif_empty2.webp';
      const path = new Date().getTime() + 'test_exif_empty2.webp';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_005
     * @tc.name      : createImageSource_promise_005
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_005';
      const fileName = 'test_dng.dng';
      const path = new Date().getTime() + 'test_dng.dng';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_006
     * @tc.name      : createImageSource_promise_006
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_006';
      const fileName = 'test_aisr.ico';
      const path = new Date().getTime() + 'test_aisr.ico';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_007
     * @tc.name      : createImageSource_promise_007
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_007';
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_008
     * @tc.name      : createImageSource_promise_008
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_008';
      const fileName = 'test8.bmp';
      const path = new Date().getTime() + 'test8.bmp';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })
    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_009
     * @tc.name      : createImageSource_promise_009
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_009';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + '全是汉字的.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_010
     * @tc.name      : createImageSource_promise_010
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_010';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + '_sad123汉字组合.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_011
     * @tc.name      : createImageSource_promise_011
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_011';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + '5446421.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })
    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_002
     * @tc.name      : createImageSource_promise_012
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_012';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + genRandomStr(100) + '.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_012
     * @tc.name      : createImageSource_options_promise_001
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_001';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_013
     * @tc.name      : createImageSource_options_promise_002
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_002';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 10,
        sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
        sourceSize: {
          height: 10,
          width: 10
        }
      };
      const fileName = 'test6.gif';
      const path = new Date().getTime() + 'test6.gif';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_014
     * @tc.name      : createImageSource_options_promise_003
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_003';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 1,
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceSize: {
          height: 1,
          width: 1
        }
      };
      const fileName = 'test7.png';
      const path = new Date().getTime() + 'test7.png';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_015
     * @tc.name      : createImageSource_options_promise_004
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_004';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test_exif_empty2.webp';
      const path = new Date().getTime() + 'test_exif_empty2.webp';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_016
     * @tc.name      : createImageSource_options_promise_005
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_005';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.RGB_888,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test_dng.dng';
      const path = new Date().getTime() + 'test_dng.dng';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_017
     * @tc.name      : createImageSource_options_promise_006
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_006';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test_aisr.ico';
      const path = new Date().getTime() + 'test_aisr.ico';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_018
     * @tc.name      : createImageSource_options_promise_007
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_007';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test.svg';
      const path = new Date().getTime() + 'test.svg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_019
     * @tc.name      : createImageSource_options_promise_008
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_008';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test8.bmp';
      const path = new Date().getTime() + 'test8.bmp';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_020
     * @tc.name      : createImageSource_options_promise_009
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_009';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 10,
        sourcePixelFormat: image.PixelMapFormat.NV12,
        sourceSize: {
          height: 10,
          width: 10
        }
      };
      const fileName = 'test.jpg';
      const path = new Date().getTime() + '全是汉字的.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_021
     * @tc.name      : createImageSource_options_promise_010
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_010';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 10,
        sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
        sourceSize: {
          height: 10,
          width: 10
        }
      };
      const fileName = 'test.jpg';
      const path = new Date().getTime() + '_sad123汉字组合.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_022
     * @tc.name      : createImageSource_options_promise_011
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_011';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 10,
        sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
        sourceSize: {
          height: 10,
          width: 10
        }
      };
      const fileName = 'test.jpg';
      const path = new Date().getTime() + '5446421.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_023
     * @tc.name      : createImageSource_options_promise_012
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_options_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_options_promise_012';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 10,
        sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
        sourceSize: {
          height: 10,
          width: 10
        }
      };
      const fileName = 'test.jpg';
      const path = new Date().getTime() + genRandomStr(100) + '.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_024
     * @tc.name      : createImageSource_fd_promise_001
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_fd_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_fd_promise_001';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + genRandomStr(100) + '.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceFdPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_025
     * @tc.name      : createImageSource_fd_promise_002
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_fd_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_fd_promise_002';
      const fileName = 'test8.bmp';
      const path = new Date().getTime() + genRandomStr(100) + '.bmp';
      await copyImageToSandbox(fileName, path);
      await createImageSourceFdPromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_026
     * @tc.name      : createImageSource_fd_promise_003
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_fd_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_fd_promise_003';
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      const fileName = 'test.jpg';
      const path = new Date().getTime() + genRandomStr(100) + '.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceFdPromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_027
     * @tc.name      : createImageSource_fd_promise_004
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_fd_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_fd_promise_004';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const fileName = 'test8.bmp';
      const path = new Date().getTime() + genRandomStr(100) + '.bmp';
      await copyImageToSandbox(fileName, path);
      await createImageSourceFdPromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_028
     * @tc.name      : createImageSource_buf_promise_001
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_buf_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_buf_promise_001';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      await createImageSourceBufPromiseTest(done, testName, buf);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_029
     * @tc.name      : createImageSource_buf_promise_002
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_buf_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_buf_promise_002';
      const buf: ArrayBuffer = new ArrayBuffer(1000);
      await createImageSourceBufPromiseTest(done, testName, buf);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_030
     * @tc.name      : createImageSource_buf_promise_003
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_buf_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_buf_promise_003';
      const buf: ArrayBuffer = new ArrayBuffer(96);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      await createImageSourceBufPromiseTest(done, testName, buf, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_031
     * @tc.name      : createImageSource_buf_promise_004
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_buf_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_buf_promise_004';
      const buf: ArrayBuffer = new ArrayBuffer(1000);
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      await createImageSourceBufPromiseTest(done, testName, buf, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_032
     * @tc.name      : createImageSource_rawfile_promise_001
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_rawfile_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_rawfile_promise_001';
      const path ='test.jpg'
      await createImageSourceRawfilePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_033
     * @tc.name      : createImageSource_rawfile_promise_002
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_rawfile_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_rawfile_promise_001';
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      const path = 'test6.gif'
      await createImageSourceRawfilePromiseTest(done, testName, path, sourceOptions);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_SOURCE_034
     * @tc.name      : createImageSource_rawfile_promise_003
     * @tc.desc      : createImageSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageSource_rawfile_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_rawfile_promise_003';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      const path = 'test6.gif';
      await createImageSourceRawfilePromiseTest(done, testName, path, sourceOptions);
    })
  })
}