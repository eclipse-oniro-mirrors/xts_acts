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
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource);
      let pixelMap: image.PixelMap = await imageSource.createPixelMap();
      console.info(TAG, testName,'creat pixelMap Success.',pixelMap);
      callback(pixelMap,imageSource);
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
 }
}

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

export default function PicturePackingPixelMapFirTestSupp() {
  describe('PicturePackingPixelMapFirTestSupp', () => {
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_001
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_001', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_001';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 98
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_002
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_002';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_003
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_003';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_004
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_004', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_004';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_005
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_005', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_005';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_006
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_006
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_006';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_007
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_007
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_007';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_008
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_008
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_008', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_008';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_009
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_009
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_009', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_009';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_010
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_010
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_010';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_011
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_011
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_011';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_012
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_012
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_012', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_012';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_013
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_013
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_013', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_013';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_014
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_014
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_014';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_015
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_015
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_015';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_016
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_016
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_016', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACKING_PIXELMAP_FIR_016';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (pixelMap,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packing(pixelMap, packOpts).then((data: ArrayBuffer) => {
            console.info(TAG, testName, 'Succeeded in packing the image.',data);
            expect(data!=undefined).assertTrue();
            imageSource.release();
            console.info(TAG, testName,'imageSource release success.');
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to packing the image.code ${error.code},message is ${error.message}`);
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