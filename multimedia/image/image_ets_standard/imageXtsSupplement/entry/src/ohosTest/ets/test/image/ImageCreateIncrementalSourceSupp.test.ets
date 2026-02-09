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

const TAG = 'ImageSource.CreateIncrementalSourceSupp'


let fdNumber: number;

function imageArray(): [Uint8Array,Uint8Array,Uint8Array] {
  let context: Context= AppStorage.get('testContext') as common.UIAbilityContext;
  let imageArray = context.resourceManager.getMediaContentSync($r('app.media.startIcon').id);
  let splitBuff1 = imageArray.slice(0, imageArray.byteLength / 2);
  let splitBuff2 = imageArray.slice(imageArray.byteLength / 2);
  return [splitBuff1,splitBuff2,imageArray]
}


export default function ImageCreateIncrementalSourceSupp() {
  describe('ImageCreateIncrementalSourceSupp', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_001
     * @tc.desc   buf: ArrayBuffer undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_001';
      try{
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(undefined);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0,imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_002
     * @tc.desc   buf: ArrayBuffer null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_002';
     try{
       const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(null);
       imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
         imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
           let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
           let imageInfo = pixelMap.getImageInfoSync();
           console.info('Succeeded in creating pixelMap',imageInfo);
           done();
         }).catch((error : BusinessError) => {
           console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
           expect().assertFail();
           done();
         })
       }).catch((error : BusinessError) => {
         console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
         expect().assertFail();
         done();
       })
     }catch (error) {
       console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
       expect(error.code).assertEqual('9001001');
       done();
     }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_003
     * @tc.desc   buf: ArrayBuffer ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_003';
      try {
        let bufAry: ArrayBuffer = AppStorage.get('empty') as ESObject;
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(bufAry);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info('Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }catch (error) {
        console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_001
     * @tc.desc   buf: ArrayBuffer ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_001';
      let sourceOptions: image.SourceOptions = { sourceDensity: 120};
      try {
        let bufAry: ArrayBuffer = AppStorage.get('empty') as ESObject;
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(bufAry, sourceOptions);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }catch (error) {
        console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_002
     * @tc.desc   buf: ArrayBuffer null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_002';
     try {
       let sourceOptions: image.SourceOptions = { sourceDensity: 120};
       const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(null, sourceOptions);
       imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
         imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
           let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
           let imageInfo = pixelMap.getImageInfoSync();
           console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
           done();
         }).catch((error : BusinessError) => {
           console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
           expect().assertFail();
           done();
         })
       }).catch((error : BusinessError) => {
         console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
         expect().assertFail();
         done();
       })
     }catch (error) {
       console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
       expect(error.code).assertEqual('9001001');
       done();
     }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_003
     * @tc.desc   buf: ArrayBuffer undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_003';
      try {
        let sourceOptions: image.SourceOptions = { sourceDensity: 120};
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(undefined, sourceOptions);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }catch (error) {
        console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_004
     * @tc.desc   buf: sourceOptions undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_004';
     try {
       const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(new ArrayBuffer(imageArray()[2].byteLength), undefined);
       imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
         imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
           let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
           let imageInfo = pixelMap.getImageInfoSync();
           console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
           done();
         }).catch((error : BusinessError) => {
           console.error(TAG,testName,`Failed to updateData imageArray()[0] error code is ${error.code}, message is ${error.message}`);
           expect().assertFail();
           done();
         })
       }).catch((error : BusinessError) => {
         console.error(TAG,testName,`Failed to updateData imageArray()[1] error code is ${error.code}, message is ${error.message}`);
         expect().assertFail();
         done();
       })
     }catch (error) {
       console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
       expect(error.code).assertEqual('9001001');
       done();

     }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_005
     * @tc.desc   buf: sourceOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_005';
      try {
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(new ArrayBuffer(imageArray()[2].byteLength), null);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG, testName, 'Succeeded in creating pixelMap', imageInfo);
            done();
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }catch (error) {
        console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_006
     * @tc.desc   buf: sourceOptions ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_006';
      try {
        let sourceOptions: image.SourceOptions = AppStorage.get('empty') as ESObject;
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(new ArrayBuffer(imageArray()[2].byteLength),sourceOptions);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        })
      }catch (error) {
        console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_007
     * @tc.desc   buf: ArrayBuffer：undefined，sourceOptions ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_007';
      try {
        let sourceOptions: image.SourceOptions = AppStorage.get('empty') as ESObject;
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(undefined,sourceOptions);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        })
      }catch (error) {
        console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_008
     * @tc.desc   buf: ArrayBuffer：undefined，sourceOptions undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_008', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_008';
        try {
          const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(undefined, undefined);
          imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
            imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
              let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
              let imageInfo = pixelMap.getImageInfoSync();
              console.info(TAG, testName, 'Succeeded in creating pixelMap', imageInfo);
              done();
            }).catch((error: BusinessError) => {
              console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
              expect().assertFail();
              done();
            })
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          })
        } catch (error) {
          console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertEqual('9001001');
          done();
        }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_009
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_009
     * @tc.desc   buf: ArrayBuffer：undefined，sourceOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_009';
     try {
       const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(undefined,null);
       imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
         imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
           let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
           let imageInfo = pixelMap.getImageInfoSync();
           console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
           done();
         }).catch((error : BusinessError) => {
           console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
           expect().assertFail();
           done();
         })
       }).catch((error : BusinessError) => {
         console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
         expect().assertFail();
         done();
       })
     }catch (error) {
       console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
       expect(error.code).assertEqual('9001001');
       done();
     }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_010
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_010
     * @tc.desc   buf: ArrayBuffer：null，sourceOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_010';
     try {
       const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(null,null);
       imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
         imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
           let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
           let imageInfo = pixelMap.getImageInfoSync();
           console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
           done();
         }).catch((error : BusinessError) => {
           console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
           expect().assertFail();
           done();
         })
       }).catch((error : BusinessError) => {
         console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
         expect().assertFail();
       })
     }catch (error) {
       console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
       expect(error.code).assertEqual('9001001');
       done();
     }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_011
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_011
     * @tc.desc   buf: ArrayBuffer：''，sourceOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_011';
     try {
       let bufAry: ArrayBuffer = AppStorage.get('empty') as ESObject;
       const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(bufAry,null);
       imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
         imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
           let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
           let imageInfo = pixelMap.getImageInfoSync();
           console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
           done();
         }).catch((error : BusinessError) => {
           console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
           expect().assertFail();
           done();
         })
       }).catch((error : BusinessError) => {
         console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
         expect().assertFail();
       })
     }catch (error) {
       console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
       expect(error.code).assertEqual('9001001');
       done();
     }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_012
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_012
     * @tc.desc   buf: ArrayBuffer：''，sourceOptions ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CreateIncrementalSource_sourceOptions_012';
      try {
        let bufAry: ArrayBuffer = AppStorage.get('empty') as ESObject;
        let sourceOptions: image.SourceOptions = AppStorage.get('empty') as ESObject;
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(bufAry,sourceOptions);
        imageSourceIncrementalSApi.updateData(imageArray()[0], false, 0, imageArray()[0].byteLength).then(() => {
          imageSourceIncrementalSApi.updateData(imageArray()[1], true, 0, imageArray()[1].byteLength).then(() => {
            let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
            let imageInfo = pixelMap.getImageInfoSync();
            console.info(TAG,testName,'Succeeded in creating pixelMap',imageInfo);
            done();
          }).catch((error : BusinessError) => {
            console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          })
        }).catch((error : BusinessError) => {
          console.error(TAG,testName,`Failed to updateData error code is ${error.code}, message is ${error.message}`);
          expect().assertFail();
        })
      }catch (error) {
        console.error(TAG, testName, `Failed to updateData error code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertEqual('9001001');
        done();
      }
    })

  })
}