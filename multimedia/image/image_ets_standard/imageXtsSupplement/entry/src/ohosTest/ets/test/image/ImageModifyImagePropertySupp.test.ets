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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'ImageSource.ModifyImagePropertySupp'
let fdNumber: number;

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

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageSourceModifyImagePropertySupp() {
  describe('ImageSourceModifyImagePropertySupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_001
     * @tc.desc   modifyImageProperty cover key:normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", "120").then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect(width).assertEqual('120');
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_002
     * @tc.desc   modifyImageProperty cover key:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty(null, "120").then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_003
     * @tc.desc   modifyImageProperty cover key:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty(undefined, "120").then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_004
     * @tc.desc   modifyImageProperty cover key:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty('', "120").then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect(error.code).assertEqual('62980146');
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_005
     * @tc.desc   modifyImageProperty cover value:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_005';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", "").then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect(error.code).assertEqual('62980135');
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_006
     * @tc.desc   modifyImageProperty cover value:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_006';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", null).then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_007
     * @tc.desc   modifyImageProperty cover value:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_007';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", undefined).then(() => {
          imageSourceApi.getImageProperty("ImageWidth").then((width: string) => {
            console.info(TAG,testName,`ImageWidth is :${width}`);
            expect().assertFail();
          }).catch((error: BusinessError) => {
            console.error(TAG,testName,`Failed to getImageProperty the Image Width, error.code ${error.code}, error.message ${error.message}`);
            expect().assertFail();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width, error.code ${error.code}, error.message ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done()
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_001
     * @tc.desc   modifyImageProperty cover key:normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", "120",(err:BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in modifying the Image Width.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_002
     * @tc.desc   modifyImageProperty cover key:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
          imageSourceApi.modifyImageProperty(null, "120",(err:BusinessError) => {
            if (err) {
              console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG,testName,'Succeeded in modifying the Image Width.');
              expect().assertFail();
            }
          })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_003
     * @tc.desc   modifyImageProperty cover key:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty(undefined, "120",(err:BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in modifying the Image Width.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_004
     * @tc.desc   modifyImageProperty cover key:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty('', "120",(err:BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual('62980146');
          } else {
            console.info(TAG,testName,'Succeeded in modifying the Image Width.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_005
     * @tc.desc   modifyImageProperty cover value:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_005';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", '', (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual('62980135');
          } else {
            console.info(TAG,testName,'Succeeded in modifying the Image Width.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_006
     * @tc.desc   modifyImageProperty cover value:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_006';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", null, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in modifying the Image Width.');
            expect().assertFail();
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_007
     * @tc.desc   modifyImageProperty cover value:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImageProperty_callback_007';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.modifyImageProperty("ImageWidth", undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to modify the Image Width.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in modifying the Image Width.');
            expect().assertFail()
          }
      })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done()
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_001
     * @tc.desc   modifyImageProperties cover key:normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let keyValues: Record<PropertyKey, string|null> = {
        [image.PropertyKey.IMAGE_WIDTH] : "1024",
        [image.PropertyKey.IMAGE_LENGTH] : "1024"
      };
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImageProperties(keyValues).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertTrue();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_002
     * @tc.desc   modifyImageProperties cover key:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImageProperties(null).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
            expect().assertFalse();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          expect().assertFalse();
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_003
     * @tc.desc   modifyImageProperties cover key:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ModifyImageProperties_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImageProperties(undefined).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
            expect().assertFalse();
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          expect().assertFalse();
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(401);
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_001
     * @tc.desc   modifyImagePropertiesEnhanced cover records:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImagePropertiesEnhanced(null).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(7700304);
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_002
     * @tc.desc   modifyImagePropertiesEnhanced cover records:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImagePropertiesEnhanced(undefined).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(7700304);
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_003
     * @tc.desc   modifyImagePropertiesEnhanced cover records:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_003';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImagePropertiesEnhanced(null).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(7700304);
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_004
     * @tc.desc   modifyImagePropertiesEnhanced cover records:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_004';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImagePropertiesEnhanced(undefined).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(7700304);
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_005
     * @tc.desc   modifyImagePropertiesEnhanced cover records:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_005';
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImagePropertiesEnhanced(null).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(7700304);
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_006
     * @tc.desc   modifyImagePropertiesEnhanced cover records:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_modifyImagePropertiesEnhanced_006';
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      let checkKey = [image.PropertyKey.IMAGE_WIDTH, image.PropertyKey.IMAGE_LENGTH];
      try {
        imageSourceApi.modifyImagePropertiesEnhanced(undefined).then(() => {
          imageSourceApi.getImageProperties(checkKey).then((data) => {
            console.info(TAG,testName,`Image Width and Image Height:${data}`);
            expect(data!=undefined).assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to modify the Image Width and Image Height, error.code ${err.code}, error.message ${err.message}`);
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect(Number(err.code)).assertEqual(7700304);
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_001
     * @tc.desc   updateData cover ArrayBuffer:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.updateData(null, false, 0, 10).then(() => {
          console.info(TAG,testName,'Succeeded in updating data.');
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_002
     * @tc.desc   updateData cover ArrayBuffer:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.updateData(undefined, false, 0, 10).then(() => {
          console.info(TAG,testName,'Succeeded in updating data.');
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_003
     * @tc.desc   updateData cover offset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, undefined, 10).then(() => {
          console.info(TAG,testName,'Succeeded in updating data.');
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_004
     * @tc.desc   updateData cover offset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, null, 10).then(() => {
          console.info(TAG,testName,'Succeeded in updating data.');
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_005
     * @tc.desc   updateData cover length:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_005';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, 0, null).then(() => {
          console.info(TAG,testName,'Succeeded in updating data.');
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_006
     * @tc.desc   updateData cover length:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_006';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, 0, undefined).then(() => {
          console.info(TAG,testName,'Succeeded in updating data.');
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_001
     * @tc.desc   updateData cover ArrayBuffer:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.updateData(null, false, 0, 10, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_002
     * @tc.desc   updateData cover ArrayBuffer:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        imageSourceApi.updateData(undefined, false, 0, 10, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_003
     * @tc.desc   updateData cover offset:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, undefined, 10, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_004
     * @tc.desc   updateData cover offset:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, null, 10, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_005
     * @tc.desc   updateData cover length:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_005';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, 0, null, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_006
     * @tc.desc   updateData cover length:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_006';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, false, 0, undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_007
     * @tc.desc   updateData cover isFinished:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_updateData_callBack_007';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      const array: ArrayBuffer = new ArrayBuffer(100);
      try {
        imageSourceApi.updateData(array, true, 0, 10, (err: BusinessError) => {
          if (err) {
            console.error(TAG,testName,`Failed to update data.code is ${err.code},message is ${err.message}`);
            expect().assertFalse();
          } else {
            console.info(TAG,testName,'Succeeded in updating data.');
          }
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to all function, error.code ${err.code}, error.message ${err.message}`);
        expect().assertFalse();
      }
      done()
    })
  })
}