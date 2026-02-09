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

  async function pictureCreatImageSource(done: Function, testName: string,pathUri: string, callback:(imageSource: image.ImageSource) => void) {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(98);
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
    console.info(TAG, testName,'create imageSource success.',imageSource);
    callback(imageSource);
  }

  let sleep = (ms: number = 66): Promise<string> => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve('');
      }, ms)
    })
  }
  export default function PicturePackDataThrTestSupp() {
    describe('PicturePackDataThrTestSupp', () => {
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
   * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_001
   * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_001
   * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
   * @tc.size       MEDIUM
   * @tc.type       Function
   * @tc.level      Level 2
   */
  it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_001', Level.LEVEL0, (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_001';
    pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures_exclude_fragment.jpg',  (imageSource) => {
      try {
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          quality: 0
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
        imagePackerObj.packToData(imageSource, packOpts)
          .then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packToData the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(401);
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        })
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        imageSource.release();
        console.info(TAG, testName,'imageSource release success.');
        done();
      }
    })
  })
  /**
   * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_002
   * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_002
   * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
   * @tc.size       MEDIUM
   * @tc.type       Function
   * @tc.level      Level 2
   */
  it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_002', Level.LEVEL0, (done: Function) => {
    const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_002';
    pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures_exclude_fragment.jpg',  (imageSource) => {
      try {
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange: image.PackingDynamicRange.SDR,
          quality: 0
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
        imagePackerObj.packToData(imageSource, packOpts)
          .then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packToData the image.',data);
            expect().assertFail();
          }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(401);
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        })
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
        imageSource.release();
        console.info(TAG, testName,'imageSource release success.');
        done();
      }
    })
  })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_003
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_003';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures_exclude_fragment.jpg', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_004
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_004';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures_exclude_fragment.jpg', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_005
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_005', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_005';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png',  (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_006
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_006
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_006';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_007
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_007
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_007';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_008
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_008
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_008';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_009
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_009
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_009', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_009';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp',  (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_010
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_010
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_010';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_011
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_011
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_011';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_012
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_012
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_012';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_013
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_013
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_013', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_013';
      pictureCreatImageSource(done,testName ,'test_exif_v4.heic',  (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_014
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_014
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_014';
      pictureCreatImageSource(done,testName ,'test_exif_v4.heic', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_015
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_015
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_015';
      pictureCreatImageSource(done,testName ,'test_exif_v4.heic', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_016
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_016
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packData_Promise_016';
      pictureCreatImageSource(done,testName ,'test_exif_v4.heic', async (imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/heic",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in create imagePackerObj.',imagePackerObj);
          imagePackerObj.packToData(imageSource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName, 'Succeeded in packToData the image.',data);
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packToData the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
          imageSource.release();
          console.info(TAG, testName,'imageSource release success.');
          done();
        }
      })
    })

  })
}