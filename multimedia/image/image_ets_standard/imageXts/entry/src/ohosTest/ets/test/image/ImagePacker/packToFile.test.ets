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
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox } from '../../common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'packToFile';

async function packToFilePromiseTest(done: Function, testName: string, pathUri: string, packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    await imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts);
    await imageSourceApi.release();
    await imagePackerApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFileAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    await imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts);
    await imageSourceApi.release();
    await imagePackerApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.Invalid_Image_Parameter).assertTrue();
    done();
  }
}

async function packToFileCallbackTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
      if (err) {
        console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in packing the image to file.');
      }
      imageSourceApi.release();
      imagePackerApi.release();
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFileAbnormalCallbackTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    imagePackerApi.packToFile(imageSourceApi, file.fd, packOpts, (err: BusinessError) => {
      if (err) {
        console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in packing the image to file.');
      }
      imageSourceApi.release();
      imagePackerApi.release();
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFilePixelMapPromiseTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFilePixelMapAbnormalPromiseTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    await imagePackerApi.packToFile(pixelmap, file.fd, packOpts);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.Invalid_Image_Parameter).assertTrue();
    done();
  }
}

async function packToFilePixelMapCallbackTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
      if (err) {
        console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in packing the image to file.');
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFilePixelMapAbnormalCallbackTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    imagePackerApi.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError) => {
      if (err) {
        console.error(TAG, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in packing the image to file.');
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function packToFilePicturePromiseTest(done: Function, testName: string, pathUri: string,
  packOpts: image.PackingOption,filename:string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(filename);
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
    let funcName = "PackToFile";
    await imagePackerApi.packToFile(pictureObj, file.fd, packOpts).then(() => {
      console.info(TAG, funcName, 'Succeeded in packing the image to file.');
    }).catch((error: BusinessError) => {
      console.error(TAG, funcName, `Failed to pack the image to file.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    });
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imagePackerPackToFileTest() {
  describe('imagePackerPackToFileTest', () => {

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
     * @tc.name   imagePacker_packToFile_promise_001
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_001
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_002
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_002
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_003
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_003
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_004
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_004  //TODO 传参 format: "image/heif" 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /* it('imagePacker_packToFile_promise_004', Level.LEVEL0, async (done: Function) => {
       const testName = 'imagePacker_packToFile_promise_004';
       const fileName = 'test.jpeg';
       const path = new Date().getTime() + 'test.jpeg';
       let packOpts: image.PackingOption = { format: "image/heif", quality: 98 };
       await copyImageToSandbox(fileName, path);
       await packToFilePromiseTest(done, testName, path, packOpts);
     })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_005
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_005  //TODO 传参 format: "image/heif" 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_006
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_006  //TODO 传参 format: "image/heif" 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_007
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_007
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_008
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_008
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_008';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_009
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_009
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_009';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_010
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_010 //TODO 传参 format: "image/heif" 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_010';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_011
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_011 //TODO 传参 format: "image/heif" 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_011';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_012
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_012 //TODO 传参 format: "image/heif" 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_012';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_013
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_013
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_013';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_014
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_014 //TODO 超时
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_014';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_015
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_015
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_015';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_016
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_016
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_016';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_017
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_017
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_017';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_018
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_018
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_018';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_019
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_019
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_019';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_020
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_020
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_020';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_021
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_021
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_021';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_022
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_022
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_022';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_023
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_023
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_023';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_024
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_024
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_024';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_025
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_025
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_025';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_026
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_026
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_026';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_027
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_027
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_027';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_028
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_028
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_028';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_029
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_029
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_029';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_030
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_030
     * @tc.desc   imagePacker_packToFile(pixelMap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_030';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_001
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_031
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_002
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_032
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_003
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_033
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_004
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_034
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_005
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_035  //TODO 超时
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_006
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_036
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_007
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_037
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_008
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_038
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_008';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_009
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_039
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_009';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_010
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_040  //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_010';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_011
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_041  //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_011';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_012
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_042  //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_012';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_013
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_043 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_013';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_014
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_044 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_014';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_015
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_045 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_015';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFileCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_016
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_046
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_016';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_017
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_047
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_017';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_018
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_048
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_018';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_019
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_049
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_019';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_020
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_050
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_020';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_021
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_051
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_021';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/webp", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_022
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_052
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_022';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_023
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_053
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_023';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_024
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_054
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_callback_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_024';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/png", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_callback_025
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_055  //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_025';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_026
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_056 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_026';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_027
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_057 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_027';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heif", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_028
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_058 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_028';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_029
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_059 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_029';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 100 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_callback_030
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_060 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_callback_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_callback_030';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/heic", quality: 0 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_001
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_061 //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: -1 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_002
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_062 //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_003
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_063  //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/svg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_004
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_064  //TODO 格式中不包含gif 但是却能通过
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/gif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_005
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_065  //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_001
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_066 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: -1 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_002
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_067 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_002';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_003
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_068 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_003';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/svg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_004
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_069 //TODO 格式中不包含gif 但是却能通过
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_004';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/gif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_005
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_070  //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_005';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_006
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_071 //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: -1 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_007
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_072 //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_008
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_073 //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_008';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/svg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_009
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_074 //TODO 格式中不包含gif 但是却能通过
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_009';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/gif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalPromiseTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_promise_010
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_075 //TODO 62980115
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_abnormal_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_promise_010';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalPromiseTest(done, testName, path, packOpts);
    })

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_006
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_076 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_006';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: -1 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_007
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_077 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_007';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_008
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_078 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_008';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/svg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_009
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_079 //TODO 格式中不包含gif 但是却能通过
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_009';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/gif", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_abnormal_callback_010
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_080 //TODO 中断
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_abnormal_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_abnormal_callback_010';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFilePixelMapAbnormalCallbackTest(done, testName, path, packOpts);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_031
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_081
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_031';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_032
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_082
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_032';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 100,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_033
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_083
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_033';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_034
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_084  //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_034';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/heif",
        quality: 98,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_035
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_085  //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_035';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/heif",
        quality: 100,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_036
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_086  //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /* it('imagePacker_packToFile_promise_036', Level.LEVEL0, async (done: Function) => {
       const testName = 'imagePacker_packToFile_promise_036';
       const fileName = 'test.jpeg';
       const path = new Date().getTime() + 'test.jpeg';
       let packOpts: image.PackingOption = {
         format: "image/heif",
         quality: 0,
         bufferSize: 10,
         desiredDynamicRange: image.PackingDynamicRange.AUTO,
         needsPackProperties: true
       };
       await copyImageToSandbox(fileName, path);
       await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
     })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_037
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_087 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_037';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/png",
        quality: 98,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_038
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_088 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_038';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/png",
        quality: 100,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_039
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_089 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_039';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/png",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_040
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_090 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_040';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/heic",
        quality: 98,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_041
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_091 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_041';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/heic",
        quality: 100,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_042
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_092 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_042';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/heic",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_043
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_093 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_043';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        quality: 98,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_044
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_094 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_044';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        quality: 100,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_045
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_095 //TODO 401
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('imagePacker_packToFile_promise_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_045';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/heic",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })*/

    /**
     * @tc.name   imagePacker_packToFile_promise_046
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_096
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_046';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        needsPackProperties: true
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })

    /**
     * @tc.name   imagePacker_packToFile_promise_047
     * @tc.number IMAGE_SOURCE_PACK_TO_DATA_097
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imagePacker_packToFile_promise_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_packToFile_promise_047';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 0,
        bufferSize: 10,
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        needsPackProperties: false
      };
      await copyImageToSandbox(fileName, path);
      await packToFilePicturePromiseTest(done, testName, path, packOpts,fileName);
    })
  })
}