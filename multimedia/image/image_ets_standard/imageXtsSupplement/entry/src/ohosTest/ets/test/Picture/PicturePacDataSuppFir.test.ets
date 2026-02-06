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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
const TAG = LOG_TAG + 'Picture.PackingPictureSupp';

async function pictureCreatImageSource(done: Function, testName: string,pathUri: string, callback:(pixelMap: image.PixelMap,imageSource:image.ImageSource) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let array = new ArrayBuffer(300000000);
  let path = `file://${testContext.filesDir}/${pathUri}`;
  console.info(TAG, testName, `path: ${path}`);
  const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  console.info(TAG, testName, `open: ${fd.fd}`);
  // await fs.close(fd );
  let readLength = await fs.read(fd.fd, array);
  console.info(TAG, testName, `readLength: ${readLength}`);
  let ops: image.SourceOptions = {
    sourceDensity: 98,
  }
  let imageSource: image.ImageSource = image.createImageSource(array, ops);
  console.info(TAG, testName,'create imageSource  Success.',imageSource);
  let pixelMap: image.PixelMap = await imageSource.createPixelMap();
  console.info(TAG, testName,'creat pixelMap Success.',pixelMap);
  callback(pixelMap,imageSource);
}

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}
export default function PicturePackDataFirTestSupp() {
  describe('PicturePackDataFirTestSupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      await sleep(500);
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_001';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 98
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts).then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_002';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg',  (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_003
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_003';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_004
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_004';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_005
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_005', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_005';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_006
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_006
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_006';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_007
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_007
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_007';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_008
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_008
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_008';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async  (pixelMap,imageSource)=> {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_009
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_009
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_009', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_009';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_010
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_010
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_010';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail()
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_011
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_011
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_011';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async  (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_012
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_012
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_PIXMAP_Promise_012';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async  (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(pixelMap, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect(data!=undefined).assertTrue();
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })





    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_001
     * @tc.desc       delayTimeList:[]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_001';
      pictureCreatImageSource(done,testName ,'test_exif_v2.jpg', async (pixelMap,imageSource) => {
        try {
          let ops: image.PackingOptionsForSequence = {
            frameCount: 3,
            delayTimeList: [],
            disposalTypes: [3, 2, 3],
            loopCount: 0
          };
          let pixelMapList = await imageSource.createPixelMapList();
          console.info(TAG, testName,'Succeeded in createPixelMapList.',pixelMapList);
          let packer = image.createImagePacker();
          packer.packToDataFromPixelmapSequence(pixelMapList, ops).then((data: ArrayBuffer) => {
            console.info('Succeeded in packing.',data);
            expect(data!=undefined).assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Faild packToDataFromPixelmapSequence, errorCode: ${error.code},errorMessage: ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_002
     * @tc.desc       disposalTypes:[]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_002';
      pictureCreatImageSource(done,testName ,'test_exif_v2.jpg', async (pixelMap,imageSource) => {
        try {
          let ops: image.PackingOptionsForSequence = {
            frameCount: 3,
            delayTimeList: [10, 10, 10],
            disposalTypes: [],
            loopCount: 0
          };
          let pixelMapList = await imageSource.createPixelMapList();
          console.info(TAG, testName,'Succeeded in createPixelMapList.',pixelMapList);
          let packer = image.createImagePacker();
          console.info(TAG, testName, 'Succeeded in createImagePacker.',packer);
          packer.packToDataFromPixelmapSequence(pixelMapList, ops).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Faild packToDataFromPixelmapSequence, errorCode: ${error.code},errorMessage: ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_003
     * @tc.desc       pixelmapSequence:null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_003';
      pictureCreatImageSource(done,testName ,'test_exif_v2.jpg', async  (pixelMap,imageSource) => {
        try {
          let ops: image.PackingOptionsForSequence = {
            frameCount: 3,
            delayTimeList: [10, 10, 10],
            disposalTypes: [3, 2, 3],
            loopCount: 0
          };
          let pixelMapList = await imageSource.createPixelMapList();
          console.info(TAG, testName,'Succeeded in createPixelMapList.',pixelMapList);
          let packer = image.createImagePacker();
          console.info(TAG, testName, 'Succeeded in createImagePacker.',packer);
          packer.packToDataFromPixelmapSequence(pixelMapList, ops).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Faild packToDataFromPixelmapSequence, errorCode: ${error.code},errorMessage: ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_004
     * @tc.desc       pixelmapSequence:undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_004';
      pictureCreatImageSource(done,testName ,'test_exif_v2.jpg', async  (pixelMap,imageSource) => {
        try {
          let ops: image.PackingOptionsForSequence = {
            frameCount: 3,
            delayTimeList: [10, 10, 10],
            disposalTypes: [3, 2, 3],
            loopCount: 0
          };
          let pixelMapList = await imageSource.createPixelMapList();
          console.info(TAG, testName,'Succeeded in createPixelMapList.',pixelMapList);
          let packer = image.createImagePacker();
          packer.packToDataFromPixelmapSequence(undefined, ops).then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packing.',data);
              expect(data!=undefined).assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Faild packToDataFromPixelmapSequence, errorCode: ${error.code},errorMessage: ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_005
     * @tc.desc       pixelmapSequence:normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_FromPixelmapSequence_005';
      pictureCreatImageSource(done,testName ,'test_exif_v2.jpg', async  (pixelMap,imageSource) => {
        try {
          let ops: image.PackingOptionsForSequence = {
            frameCount: 3,
            delayTimeList: [10, 10, 10],
            disposalTypes: [3, 2, 3],
            loopCount: 0
          };
          let pixelMapList = await imageSource.createPixelMapList();
          console.info(TAG, testName,'Succeeded in createPixelMapList.',pixelMapList);
          let packer = image.createImagePacker();
          packer.packToDataFromPixelmapSequence(pixelMapList, ops).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            done();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Faild packToDataFromPixelmapSequence, errorCode: ${error.code},errorMessage: ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })




  })
}