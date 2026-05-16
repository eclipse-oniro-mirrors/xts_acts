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
import { driveFn, getPermission, isEmpty, LOG_TAG, sleep } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import fileio from '@ohos.fileio';

let fdNumber: number;
const TAG = 'ImageImagePackerPackingToFile';
interface HdrPicture {
  uri: string,
  fd: number,
  fileSize: number,
  fileData: ArrayBuffer
}
async function createPictureObj(done:Function,testName: string, pathUri: string): Promise<image.Picture> {
  try {
    let fileC = fs.openSync(pathUri, fs.OpenMode.READ_ONLY);
    const imageSourceObj: image.ImageSource = image.createImageSource(fileC.fd);
    console.info(TAG, testName, 'createImageSource Successful.');
    let commodityPixelMap: image.PixelMap = await imageSourceObj.createPixelMap();
    console.info(TAG, testName, 'createPixelMap Successful.');
    fs.closeSync(fileC.fd);
    return image.createPicture(commodityPixelMap);
  } catch (error) {
    console.error(TAG, testName, ` failed; error:`, JSON.stringify(error), error.code);
    expect().assertFail()
    return error;
  }
}
const testImageSourceCreatePixelMap = async (file: string | number | ArrayBuffer, desiredFormat: image.PixelMapFormat) => {
  let imageSource: image.ImageSource;
  if (typeof file == 'string') {
    let buffer = await getBuffer(file);
    imageSource = image.createImageSource(buffer);
  } else if (typeof file == 'number') {
    imageSource = image.createImageSource(file);
  } else {
    imageSource = image.createImageSource(file);
  }
  let decodingOpt: image.DecodingOptions = {
    editable: true,
    desiredPixelFormat: desiredFormat,
    desiredDynamicRange: image.DecodingDynamicRange.HDR
  }
  let pixelMap = await imageSource.createPixelMap(decodingOpt);
  if (pixelMap.getImageInfoSync().pixelFormat != desiredFormat) {
    try {
      await pixelMap.convertPixelFormat(desiredFormat);
    } catch (error) {
      console.info(TAG, "image10bitPixelMap", 'convertPixelFormat failed, msg:%{public}s', JSON.stringify(error));
    }
  }
  return pixelMap;
}

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}
const checkPackResult = async (orgInfo: image.ImageInfo, file: number | ArrayBuffer, format: image.PixelMapFormat, mimeType: string) => {
  let newPixelMap = await testImageSourceCreatePixelMap(file, format);
  let newInfo = newPixelMap.getImageInfoSync();
  console.log(`org width: ${orgInfo.size.width}, new width: ${newInfo.size.width}`)
  console.log(`org height: ${orgInfo.size.height}, new height: ${newInfo.size.height}`)
  console.log(`org format: ${orgInfo.pixelFormat}, new width: ${newInfo.pixelFormat}`)
  console.log(`org isHdr: ${orgInfo.isHdr}, new width: ${newInfo.isHdr}`)
  console.log(`org mimeType: ${orgInfo.mimeType}, new mimeType: ${newInfo.mimeType}`)
  return orgInfo.size.width == newInfo.size.width && orgInfo.size.height == newInfo.size.height &&
    orgInfo.pixelFormat == newInfo.pixelFormat && orgInfo.isHdr == newInfo.isHdr &&
    mimeType == newInfo.mimeType
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
let openHdrPic: HdrPicture;
const getBuffer = async (fileName: string) => {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  let file = fs.openSync(filePath);
  const stats = fs.statSync(filePath);
  const fileSize = stats.size;
  const bufferRead = new ArrayBuffer(fileSize)
  fs.readSync(file.fd, bufferRead)
  openHdrPic = { uri: filePath, fd: file.fd, fileSize: fileSize, fileData: bufferRead }
  return bufferRead
}
export default function ImagePackerPackingToFilePictureTest() {
  describe('ImagePackerPackingToFilePictureTest', () => {
    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await sleep(2000);
      AppStorage.setOrCreate("emptyString", "");
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete("emptyString")
      console.info(TAG, 'afterAll case.');
    });
    
    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_001
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_001
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      console.info(TAG, testName, 'image case filePath is ' + path);
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/bluesky.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(undefined as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_002
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_002
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/bluesky.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(null as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_003
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_003
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/bluesky.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile("" as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_004
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_004
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_004';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/bluesky.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, null as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_005
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_005
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_005';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/bluesky.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, undefined as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_006
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_006
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_006';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/bluesky.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, "" as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_007
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_007
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_007';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test.9.png";
      console.info(TAG, testName, 'image case filePath is ' + path);
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/test.9.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(undefined as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_008
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_008
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_008';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test.9.png";
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/test.9.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(null as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_009
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_009
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_009';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test.9.png";
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/test.9.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile("" as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_010
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_010
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_010';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test.9.png";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/test.9.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, null as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_011
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_011
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_011';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test.9.png";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/test.9.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, undefined as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_012
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_012
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_012';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "test.9.png";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/test.9.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, "" as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_013
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_013
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_013';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + " pixel_bmp_480x360.bmp";
      console.info(TAG, testName, 'image case filePath is ' + path);
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/png",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/pixel_bmp_480x360.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(undefined as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_014
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_014
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_014';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + " pixel_bmp_480x360.bmp";
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/png",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/pixel_bmp_480x360.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(null as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_015
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_015
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_015';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + " pixel_bmp_480x360.bmp";
      try {
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/png",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/pixel_bmp_480x360.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile("" as ESObject as image.Picture, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_016
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_016
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_016';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "pixel_bmp_480x360.bmp";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/pixel_bmp_480x360.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, undefined as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_017
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_017
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_017';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "pixel_bmp_480x360.bmp";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/pixel_bmp_480x360.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, null as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_018
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_018
     * @tc.desc    Test_imagePacker_Packing_To_File
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_018';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "pixel_bmp_480x360.bmp";
      try {
        let pictureObj: image.Picture=await createPictureObj(done,testName,path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        const filePath: string = 'file://' + testContext.filesDir + "/pixel_bmp_480x360.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        await imagePackerApi.packToFile(pictureObj, file.fd, "" as ESObject as image.PackingOption);
        console.info(TAG, testName, 'packToFile success');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019
     * @tc.desc    Test_imagePacker_Packing_To_File cover desiredDynamicRange:SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: true
        };
        const filePath: string = 'file://' + testContext.filesDir + "/IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        await imagePackerObj.packToFile(pictureObj, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020
     * @tc.desc    Test_imagePacker_Packing_To_File cover needsPackProperties: false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        const filePath: string = 'file://' + testContext.filesDir + "/IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        await imagePackerObj.packToFile(pictureObj, file.fd, packOpts);
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021
     * @tc.desc    Test_imagePacker_Packing_To_File cover  file.fd: null
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        await imagePackerObj.packToFile(pictureObj, null, packOpts);
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_022
     * @tc.name    IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_022
     * @tc.desc    Test_imagePacker_Packing_To_File cover  file.fd: undefined
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_022';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');

      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          bufferSize: 10,
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          needsPackProperties: false
        };
        let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        await imagePackerObj.packToFile(pictureObj, undefined, packOpts);
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })


  })
}