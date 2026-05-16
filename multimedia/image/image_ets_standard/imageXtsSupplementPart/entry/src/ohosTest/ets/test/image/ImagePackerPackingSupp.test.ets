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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'Image.ImageImagePackerPackingSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function packingTest( testName: string,   pathUri:string,callback: (imageSourceObj: image.ImageSource) => void,
) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  let imageSourceObj: image.ImageSource = image.createImageSource(path)
  console.info(TAG,testName,'createImageSource',imageSourceObj);
  if(imageSourceObj==undefined){
    console.error(TAG,testName,'No such file');
    expect().assertFail();
  }else {
    callback(imageSourceObj)
    await imageSourceObj.release();
  }
}

export default function ImageImagePackerPackingSupp() {
  describe('ImageImagePackerPackingSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty','')
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
      AppStorage.delete('empty')
    });


    /**
     * @tc.name   image_Packer_packing_Supp_001
     * @tc.number image_Packer_packing_Supp_001
     * @tc.desc   ImagePacker,packing,source:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_001';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(null, packOpts, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   image_Packer_packing_Supp_002
     * @tc.number image_Packer_packing_Supp_002
     * @tc.desc   ImagePacker,packing,source:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_002';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(undefined, packOpts, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_003
     * @tc.number image_Packer_packing_Supp_003
     * @tc.desc   ImagePacker,packing,source:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_003';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          let source: image.ImageSource = AppStorage.get('empty') as ESObject;
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(source, packOpts, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_004
     * @tc.number image_Packer_packing_Supp_004
     * @tc.desc   ImagePacker,packing,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_004';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(imageResource, undefined, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_005
     * @tc.number image_Packer_packing_Supp_005
     * @tc.desc   ImagePacker,packing,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_005';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(imageResource, null, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_006
     * @tc.number image_Packer_packing_Supp_006
     * @tc.desc   ImagePacker,packing,packOpts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_006';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(imageResource, packOpts, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_007
     * @tc.number image_Packer_packing_Supp_007
     * @tc.desc   ImagePacker,imageResource:null,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_007';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(null, null, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_008
     * @tc.number image_Packer_packing_Supp_008
     * @tc.desc   ImagePacker,imageResource:null,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_008';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(null, undefined, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_009
     * @tc.number image_Packer_packing_Supp_009
     * @tc.desc   ImagePacker,imageResource:undefined,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_009';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(undefined, null, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_010
     * @tc.number image_Packer_packing_Supp_010
     * @tc.desc   ImagePacker,imageResource:'',packOpts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_010';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
          let source:image.ImageSource = AppStorage.get('empty') as ESObject;
          imagePackerObj.packing(source, packOpts, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Supp_011
     * @tc.number image_Packer_packing_Supp_011
     * @tc.desc   ImagePacker,imageResource:undefined,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Supp_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Supp_011';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(undefined, undefined, (err: BusinessError, data: ArrayBuffer) => {
            if (err) {
              console.error(TAG, testName,`Failed to pack the image.code ${err.code},message is ${err.message},`);
              expect(err.code).assertUndefined();
            } else {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }
            done();
          })
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   image_Packer_packing_Promise_Supp_001
     * @tc.number image_Packer_packing_Promise_Supp_001
     * @tc.desc   ImagePacker,packing,source:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_001';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(null, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
            done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_002
     * @tc.number image_Packer_packing_Promise_Supp_002
     * @tc.desc   ImagePacker,packing,source:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_002';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(undefined, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_003
     * @tc.number image_Packer_packing_Promise_Supp_003
     * @tc.desc   ImagePacker,packing,source:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_003';
      let source:image.ImageSource = AppStorage.get('empty') as ESObject;
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(source, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_004
     * @tc.number image_Packer_packing_Promise_Supp_004
     * @tc.desc   ImagePacker,packing,packOpts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_004';
      let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(imageResource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_005
     * @tc.number image_Packer_packing_Promise_Supp_005
     * @tc.desc   ImagePacker,packing,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_005';
      let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(imageResource, undefined)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_006
     * @tc.number image_Packer_packing_Promise_Supp_006
     * @tc.desc   ImagePacker,packing,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_006';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(imageResource, null)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_007
     * @tc.number image_Packer_packing_Promise_Supp_007
     * @tc.desc   ImagePacker,imageResource:null,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_007';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(null, null)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_008
     * @tc.number image_Packer_packing_Promise_Supp_008
     * @tc.desc   ImagePacker,imageResource:null,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_008';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(null, undefined)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_009
     * @tc.number image_Packer_packing_Promise_Supp_009
     * @tc.desc   ImagePacker,imageResource:undefined,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_009';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(undefined, null)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
              expect(error.code).assertUndefined();
            })
            done();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_010
     * @tc.number image_Packer_packing_Promise_Supp_010
     * @tc.desc   ImagePacker,imageResource:'',packOpts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_010';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
          let source:image.ImageSource = AppStorage.get('empty') as ESObject;
          imagePackerObj.packing(source, packOpts )
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packing_Promise_Supp_011
     * @tc.number image_Packer_packing_Promise_Supp_011
     * @tc.desc   ImagePacker,imageResource:undefined,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packing_Promise_Supp_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packing_Promise_Supp_011';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packing(undefined, undefined)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertUndefined();
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_001
     * @tc.number image_Packer_packToData_Promise_Supp_001
     * @tc.desc   ImagePacker,packToData,source:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_001';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(null, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packToData the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_002
     * @tc.number image_Packer_packToData_Promise_Supp_002
     * @tc.desc   ImagePacker,packToData,source:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_002';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(undefined, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_003
     * @tc.number image_Packer_packToData_Promise_Supp_003
     * @tc.desc   ImagePacker,packing,source:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_003';
      let source:image.ImageSource = AppStorage.get('empty') as ESObject;
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(source, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_004
     * @tc.number image_Packer_packToData_Promise_Supp_004
     * @tc.desc   ImagePacker,packing,packOpts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_004';
      let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(imageResource, packOpts)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_005
     * @tc.number image_Packer_packToData_Promise_Supp_005
     * @tc.desc   ImagePacker,packing,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_005';
      let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(imageResource, undefined)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_006
     * @tc.number image_Packer_packToData_Promise_Supp_006
     * @tc.desc   ImagePacker,packing,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_006';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(imageResource, null)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_007
     * @tc.number image_Packer_packToData_Promise_Supp_007
     * @tc.desc   ImagePacker,imageResource:null,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_007';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(null, null)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_008
     * @tc.number image_Packer_packToData_Promise_Supp_008
     * @tc.desc   ImagePacker,imageResource:null,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_008';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(null, undefined)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_009
     * @tc.number image_Packer_packToData_Promise_Supp_009
     * @tc.desc   ImagePacker,imageResource:undefined,packOpts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_009';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(undefined, null)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_010
     * @tc.number image_Packer_packToData_Promise_Supp_010
     * @tc.desc   ImagePacker,imageResource:'',packOpts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_010';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          let packOpts:image.PackingOption = AppStorage.get('empty') as ESObject;
          let source:image.ImageSource = AppStorage.get('empty') as ESObject;
          imagePackerObj.packToData(source, packOpts )
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   image_Packer_packToData_Promise_Supp_011
     * @tc.number image_Packer_packToData_Promise_Supp_011
     * @tc.desc   ImagePacker,imageResource:undefined,packOpts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_Packer_packToData_Promise_Supp_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Packer_packToData_Promise_Supp_011';
      try {
        await packingTest(testName,'test_exif_v2.jpg',(imageResource) => {
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName,'Succeeded in imagePackerObj.');
          imagePackerObj.packToData(undefined, undefined)
            .then((data: ArrayBuffer) => {
              console.info(TAG, testName,'Succeeded in packing the image.');
              expect().assertFail();
            }).catch((error: BusinessError) => {
            console.error(TAG, testName,`Failed to pack the image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(401);
          })
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })



  })
}