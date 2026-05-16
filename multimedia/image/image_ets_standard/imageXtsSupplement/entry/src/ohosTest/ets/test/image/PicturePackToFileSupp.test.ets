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
const TAG = LOG_TAG + 'Picture.PackToFilePictureSupp';

async function pictureCreatImageSource(done: Function, testName: string,pathUri: string, callback:(file: fs.File,imageSource:image.ImageSource) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource);
      let targetpath = `file://${testContext.filesDir}/${testName}`;
      let file = fs.openSync(targetpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      callback(file,imageSource);
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

export default function PicturePackToFileTestSupp() {
  describe('PicturePackToFileTestSupp', () => {
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
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_001';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 98
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_002';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_003';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_004';
      pictureCreatImageSource(done,testName ,'AllAuxiliaryPictures.jpg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_005';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_006';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_007';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_008';
      pictureCreatImageSource(done,testName ,'test_exif_v2.png', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/png",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_009
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_009
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_009', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_009';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_010
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_010
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_010';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_011
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_011
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_011';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_012
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_012
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_012', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_012';
      pictureCreatImageSource(done,testName ,'test_exif_v3.webp', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/webp",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_013
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_013
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_013', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_013';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'create imagePackerObj success.',imagePackerObj);
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_014
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_014
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_014';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_015
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_015
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_015';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:false
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_016
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_016
     * @tc.desc       image.imageSource.packToFile,needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_016', Level.LEVEL0, (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_PACK_TO_FILE_CALLBACK_016';
      pictureCreatImageSource(done,testName ,'test.jpeg', async (file,imageSource) => {
        try {
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            desiredDynamicRange: image.PackingDynamicRange.SDR,
            quality: 0,
            needsPackProperties:true
          };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          imagePackerObj.packToFile(imageSource, file.fd, packOpts, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image to file.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image to file.');
              imageSource.release();
              console.info(TAG, testName,'imageSource release success.');
              done();
            }
          })
        } catch (err) {
          console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
          expect().assertFail();
        }
      })
    })


  })
}