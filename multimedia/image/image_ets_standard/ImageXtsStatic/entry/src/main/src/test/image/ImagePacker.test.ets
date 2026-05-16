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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';
import { BusinessError } from '@ohos.base';
const TAG = 'xtsStatic_imagePackerStaticTest';

async function pictureCreatImageSource(done: () => void,testName: string,pathUri: string, callback:(file: fs.File, imageSource:image.ImageSource|undefined ) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource |undefined = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource!);
      let targetpath = `file://${testContext.filesDir}/${testName}`;
      let file = fs.openSync(targetpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      callback(file,imageSource!);
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
  }
}
async function picturePixelMapCreatImageSource(done: () => void, testName: string,pathUri: string, callback:(file: fs.File,pixelMap: image.PixelMap|undefined) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource|undefined = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource);
      let pixelMap: image.PixelMap |undefined = await imageSource.createPixelMap();
      console.info(TAG, testName,'creat pixelMap Success.',pixelMap!);
      let targetpath = `file://${testContext.filesDir}/${pathUri}`;
      let file = fs.openSync(targetpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      callback(file,pixelMap!);
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
  }
}
async function pictureCreatImagePixeMapSource(done: () => void, testName: string, pathUri: string, callback:(pixelMap: image.PixelMap,imageSource:image.ImageSource) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  console.info(TAG, testName, `path: ${path}`);
  let imageSource: image.ImageSource|undefined = image.createImageSource(path);
  console.info(TAG, testName,'create imageSource  Success.',imageSource!);
  let pixelMap: image.PixelMap |undefined = await imageSource!.createPixelMap();
  console.info(TAG, testName,'creat pixelMap Success.',pixelMap!);
  callback(pixelMap!,imageSource!);
}
async function createPictureObj(done:()=>void, testName: string, pathUri: string): Promise<image.Picture|undefined> {
  try {
    let fileC = fs.openSync(pathUri, fs.OpenMode.READ_ONLY);
    const imageSourceObj: image.ImageSource |undefined= image.createImageSource(fileC.fd);
    console.info(TAG, testName, 'createImageSource Successful.');
    let commodityPixelMap: image.PixelMap |undefined = await imageSourceObj!.createPixelMap();
    console.info(TAG, testName, 'createPixelMap Successful.');
    fs.closeSync(fileC.fd);
    return image.createPicture(commodityPixelMap!);
  } catch (error) {
    console.error(TAG, testName, ` failed; error:`, JSON.stringify(error), error.code);
    expect().assertFail();
    return undefined;
  }
}

 async function copyImageToSandbox(fileName: string, pathUri: string) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}

export default function ImagePackerStaticTest(): void {
  describe('ImagePackerStaticTest', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath =  testContext.filesDir + "/" + fileName;
      console.info(TAG,"image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };

    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = filesDir + "/" + fileName;
      return filePath;
    }

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
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0100
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0100
     * @tc.desc    Test_SUB_MEDIA_IMAGE_imagePackerPacking_To_File cover desiredDynamicRange:SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      console.info(TAG, testName, 'openSync success',imageSourceApi);
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
        const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_019.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap | undefined = await imageSourceApi!.createPixelMap();
        console.info(TAG, testName, 'commodityPixelMap success',commodityPixelMap);
        let pictureObj: image.Picture | undefined = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'image.createPicture(commodityPixelMap!) success',pictureObj);
        await imagePackerObj.packToFile(pictureObj!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
        expect(imageSourceObj!!=undefined).assertTrue();
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0200
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0200
     * @tc.desc    Test_SUB_MEDIA_IMAGE_imagePackerPacking_To_File cover needsPackProperties: false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
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
        const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_020.jpg";
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        console.info(TAG, testName, 'openSync success');
        let commodityPixelMap: image.PixelMap |undefined= await imageSourceApi!.createPixelMap();
        console.info(TAG, testName, 'commodityPixelMap success',commodityPixelMap);
        let pictureObj: image.Picture |undefined = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'image.createPicture(commodityPixelMap!) success',pictureObj);
        await imagePackerObj.packToFile(pictureObj!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
        console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
        expect(imageSourceObj!!=undefined).assertTrue();
        console.info(TAG, testName, 'packToFile success');
        done();
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0100
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0100
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 98
            };
            const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021.jpg";
            let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
              if (err) {
                console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName,'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName,'imageSource release success.');
                done();
              }
            })
          }
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0200
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0200
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('AllAuxiliaryPictures.jpg');
      const imageSource: image.ImageSource | undefined = image.createImageSource(fd);
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const filePath: string = 'file://' + testContext.filesDir + "/SUB_MEDIA_IMAGE_PACKER_PACKING_TO_FIlE_PROMISE_021.jpg";
            let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'image.createImagePacker() success',imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0300
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0300
     * @tc.desc       format: "image/png",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0300', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0300';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,imageSource) => {
        try {
        let ranges: image.PackingDynamicRange[] = [
          image.PackingDynamicRange.AUTO,
          image.PackingDynamicRange.SDR
        ]
        for (const range of ranges) {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: range,
            quality: 98
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
          imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG, testName,
                `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in packing the image to file.');
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
              console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
              expect(imageSourceObj!!=undefined).assertTrue();
              imageSource!.release();
              console.info(TAG, testName, 'imageSource release success.');
              done();
            }
          })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0400
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0400
     * @tc.desc       format: "image/png",needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0400', Level.LEVEL0,(done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0400';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0500
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0500
     * @tc.desc       format: "image/webp",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0500', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0500';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0600
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0600
     * @tc.desc       format: "image/webp",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0600', Level.LEVEL0,  (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0600';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0700
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0700
     * @tc.desc       format: "image/jpeg"，desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0700', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0700';
      pictureCreatImageSource(done,testName ,'test.jpeg',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 0
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG, testName,
                  `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0800
     * @tc.name       SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0800
     * @tc.desc       format: "image/jpeg",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0800', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_CALLBACK_static_0800';
      pictureCreatImageSource(done,testName ,'test.jpeg',  (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.SDR,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts, (err: BusinessError|null) => {
              if (err) {
                console.error(TAG, testName, `Failed to pack the image to file.code ${err.code},message is ${err.message}`);
                expect().assertFail();
              } else {
                console.info(TAG, testName, 'Succeeded in packing the image to file.');
                const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
                console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
                expect(imageSourceObj!!=undefined).assertTrue();
                imageSource!.release();
                console.info(TAG, testName, 'imageSource release success.');
                done();
              }
            })
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0100
     * @tc.desc       format: "image/jpeg",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0100';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0200
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0200';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
            }
          }catch (err) {
            console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
            expect().assertFail();
          }
        })
      })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0300
     * @tc.desc       format: "image/png",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0300', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0300';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0400
     * @tc.desc       format: "image/png",needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0400', Level.LEVEL0,(done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0400';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0500
     * @tc.desc       format: "image/webp",desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0500', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0500';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: range,
              quality: 98
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0600
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0600
     * @tc.desc       format: "image/webp",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0600', Level.LEVEL0,  (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0600';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/webp",
              desiredDynamicRange: image.PackingDynamicRange.AUTO,
              quality: 98,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0700
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0700
     * @tc.desc       format: "image/jpeg"，desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0700', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0700';
      pictureCreatImageSource(done,testName ,'test.jpeg',  (file,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 0
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0800
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0800
     * @tc.desc       format: "image/jpeg",needsPackProperties:false/true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0800', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PROMISE_static_0800';
      pictureCreatImageSource(done,testName ,'test.jpeg', (file,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: image.PackingDynamicRange.SDR,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(imageSource!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            console.info(TAG, testName, 'Packing succeeded.',JSON.stringify(imageSourceObj!));
            expect(imageSourceObj!!=undefined).assertTrue();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
        imageSource!.release();
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0100
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0100';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,pixelMap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(pixelMap!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
          // let state = await fs.stat(file.fd);
          // console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
          // expect(state.size > 0).assertTrue;
            done();
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0500
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0500', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0500';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,pixelMap) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
          imagePackerObj.packToFile(pixelMap!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile the image.');
          // let state = await fs.stat(file.fd);
          // console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
          // expect(state.size > 0).assertTrue;
          done();
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0200
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false/ture
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0200';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (file,pixelMap) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/png",
              desiredDynamicRange: image.PackingDynamicRange.SDR,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            imagePackerObj.packToFile(pixelMap!, file.fd, packOpts)
            console.info(TAG, testName, 'Succeeded in packToFile the image.');
            // let state = await fs.stat(file.fd);
            // console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            // expect(state.size > 0).assertTrue;
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0300
     * @tc.desc       image.imageSource.packToFile,isEditable:false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0300', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0300';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0300.jpg";
        image.createPixelMap(color, opts).then(async (pixelmap: image.PixelMap|undefined) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
          const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd);
          const imageInfo =await imageSourceObj!.getImageInfo();
          console.info(TAG, testName, ' imageSourceObj getImageInfo succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await imagePackerObj!.release();
          await pixelmap!.release();
        })
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0400
     * @tc.desc       image.imageSource.packToFile,isEditable:true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0400', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0400';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_static_0400.jpg";
        image.createPixelMap(color, opts).then(async (pixelmap: image.PixelMap|undefined) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
          let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
          const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd);
          const imageInfo =await imageSourceObj!.getImageInfo();
          console.info(TAG, testName, 'Packing succeeded.');
          expect(imageInfo!.size.width > 0).assertTrue();
          await imagePackerObj!.release();
          await pixelmap!.release();
        })
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        done();
      }
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0100
     * @tc.desc       image.imageSource.packToFile,isEditable:true/false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0100';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        let booleanValues = [true, false];
        for (const flag of booleanValues) {
          const opts: image.InitializationOptions = {
            editable: flag,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: {height: 4, width: 6}
          };
          const path: string = `${testContext.filesDir}/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0100.jpg`;
          console.info(TAG, testName, 'path is:',path);
          let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
          console.info(TAG, testName, 'image.createPixelMap',pixelmap);
          const packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'image.createImagePacker',imagePackerObj);
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
              expect().assertFail();
            } else {
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
            Promise.all([
              pixelmap.release(),
              imagePackerObj!.release()
            ]
            ).then(() => {
              console.info(TAG, testName, 'pixelmap imagePackerObj release.');
              done();
            })
          })
        }
      }catch (err) {
        console.error(TAG, testName, `Unexpected error: code=${err.code}, msg=${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0200
     * @tc.desc       image.imageSource.packToFile,image.PackingDynamicRange.AUTO, needsPackProperties: true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0200';
      try {
        let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const path: string = `${testContext.filesDir}/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0200`;
        let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const packOpts: image.PackingOption = { format: "image/jpeg", desiredDynamicRange: image.PackingDynamicRange.AUTO, needsPackProperties: true,quality: 98 };
        const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
            expect().assertFail();
          } else {
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            const imageInfo = imageSourceObj!.getImageInfoSync();
            console.info(TAG, testName, 'Packing succeeded.');
            expect(imageInfo!.size.width > 0).assertTrue();
          }
          Promise.all([
            pixelmap.release(),
            imagePackerObj!.release()
          ]
          ).then(() => {
            console.info(TAG, testName, 'pixelmap imagePackerObj release.');
            done();
          })
        })
      } catch (err) {
        console.error(TAG, testName, `Unexpected error: code=${err.code}, msg=${err.message}`);
        expect().assertFail();
        done();
      }
    });




    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0100
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0100
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.PackingDynamicRange.AUTO/SDR
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture|undefined = await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let ranges: image.PackingDynamicRange[] = [
          image.PackingDynamicRange.AUTO,
          image.PackingDynamicRange.SDR
        ]
        for (const range of ranges) {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: range,
            quality: 0,
            needsPackProperties: true
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer!=undefined).assertTrue();
          done();
        }
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0200
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0200
     * @tc.desc    SUB_MEDIA_IMAGE_imagePackerpacking image.needsPackProperties.true/false
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACKING_pictureObj_PROMISE_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      try {
        let pictureObj: image.Picture |undefined= await createPictureObj(done, testName, path);
        const imagePackerApi: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName, 'createImagePacker Successful.');
        let booleanValues = [true, false]
        for (const flag of booleanValues) {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties: flag,
          };
          let buffer = await imagePackerApi.packing(pictureObj!, opts)
          console.info(TAG, testName, 'Succeeded in packing the image.' + buffer);
          expect(buffer!=undefined).assertTrue();
          done();
        }
      }catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0100
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0100
     * @tc.desc   delayTimeList非空数组覆盖，test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0100';
      // const path ='moving_test.gif';
      try {
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer.byteLength > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0200
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0200
     * @tc.desc   disposalTypes:非空数组覆盖，delayTimeList空数组覆盖，test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0200';
      // const path ='moving_test.gif';
      try {
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence success', buffer);
        expect(buffer!=undefined).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0300
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0300
     * @tc.desc   disposalTypes:空数组覆盖,test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_static_0300';
      // const path ='moving_test.gif';
      try {
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer!=undefined).assertTrue();
        done();
       } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    })





    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0100
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO/SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0100', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0100';
      pictureCreatImagePixeMapSource(done,testName ,'AllAuxiliaryPictures.jpg', (pixelMap,imageSource) => {
        try {
          let ranges: image.PackingDynamicRange[] = [
            image.PackingDynamicRange.AUTO,
            image.PackingDynamicRange.SDR
          ]
          for (const range of ranges) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange: range,
              quality: 0,
              needsPackProperties: true
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            let data = imagePackerObj.packToData(pixelMap!, packOpts)
            console.info(TAG, testName, 'Succeeded in packToData the image.', data);
            expect(data != undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0200
     * @tc.desc       desiredDynamicRange: image.needsPackProperties.true/false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0200', Level.LEVEL0, (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_PIXMAP_Promise_static_0200';
      pictureCreatImagePixeMapSource(done,testName ,'AllAuxiliaryPictures.jpg', (pixelMap,imageSource) => {
        try {
          let booleanValues = [true, false]
          for (const flag of booleanValues) {
            let packOpts: image.PackingOption = {
              format: "image/jpeg",
              desiredDynamicRange:image.PackingDynamicRange.AUTO,
              quality: 0,
              needsPackProperties: flag
            };
            const imagePackerObj: image.ImagePacker = image.createImagePacker();
            console.info(TAG, testName, 'create imagePackerObj success.', imagePackerObj);
            let data = imagePackerObj.packToData(pixelMap!, packOpts)
            console.info(TAG, testName, 'Succeeded in packToData the image.', data);
            expect(data != undefined).assertTrue();
            imageSource!.release();
            done();
          }
        }catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0100
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,needsPackProperties: false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'AllAuxiliaryPictures_exclude_fragment.jpg';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0,
            needsPackProperties: false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          let buffer = await imagePackerObj.packToData(imageSource!, packOpts)
          console.info(TAG, testName, 'Succeeded in packToData the image.', buffer);
          expect(buffer != undefined).assertTrue();
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      imageSource!.release();
      done();
      })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0200
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR, needsPackProperties: true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerpackData_ImageSource_Promise_static_0200';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'AllAuxiliaryPictures_exclude_fragment.jpg';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      try {
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0,
          needsPackProperties: true
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
        let buffer = await imagePackerObj.packToData(imageSource!, packOpts)
        console.info(TAG, testName, 'Succeeded in packToData the image.', buffer);
        expect(buffer != undefined).assertTrue();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      imageSource!.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0100
     * @tc.desc   第3个参数属性delayTimeList:非空数组覆盖，pixelMapList非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      try {
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let pixelMapList = await imageSource!.createPixelMapList();
        let outputPath = `${testContext.filesDir}/${outputPathUri}`;
        let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
        let state = await fs.stat(file.fd);
        console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
        expect(state.size > 0).assertTrue;
        await Packer.release();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0200
     * @tc.desc   第3个参数属性delayTimeList:空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0200'
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
        try {
          let pixelMapList = await imageSource!.createPixelMapList();
          let outputPath = `${testContext.filesDir}/${outputPathUri}`;
          let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          let Packer = image.createImagePacker();
          await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack)
          console.info(TAG,testName,'Succeeded in packToFileMultiFrames.');
          let state= await fs.stat( file.fd);
          console.info(TAG,testName,'Succeeded in fs.stat.',state);
          expect(state.size > 0).assertTrue;
          await Packer.release();
          done();
        } catch (error) {
          console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
          done();
        }
      })


    /**
     * @tc.number  SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0300
     * @tc.name    SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0300
     * @tc.desc    Packer.packToFileFromPixelmapSequence,disposalTypes: []
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_static_0300';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [],
        loopCount: 0
      };
      try {
        let pixelMapList = await imageSource!.createPixelMapList();
        let outputPath = `${testContext.filesDir}/${outputPathUri}`;
        let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        console.info(TAG,testName,'Succeeded in packToFileFromPixelmapSequence.');
        let state = await fs.stat(file.fd);
        console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
        expect(state.size > 0).assertTrue;
        await Packer.release();
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number  SUB_MEDIA_IMAGE_PACKER_release_static_0100
     * @tc.name    SUB_MEDIA_IMAGE_PACKER_release_static_0100
     * @tc.desc    imagePackerObj.release调用
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_PACKER_release_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_release_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let fd: int = getFd('test_exif_v2.jpg');
      // const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        const imagePackerObj: image.ImagePacker = await image.createImagePacker();
        console.info(TAG, testName,'Succeeded in image.createImagePacker().',imagePackerObj);
        imagePackerObj.release((err: BusinessError|null)=>{
          if (err) {
            console.error(TAG, testName,`Failed to release image packaging.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName,'Succeeded in releasing image packaging.');
          }
        })
      } catch (error) {
        console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
        expect().assertFail();
      }
      done();
    })

  })
}