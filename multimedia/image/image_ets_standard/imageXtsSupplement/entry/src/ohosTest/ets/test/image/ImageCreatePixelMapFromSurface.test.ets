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
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = 'Image.createPixelMapFromSurfaceSupp'
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


export default function ImageCreatePixelMapFromSurface() {
  describe('ImageCreatePixelMapFromSurface', () => {
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
     * @tc.name   image_CreatePixelMapFromSurface_Promise_001
     * @tc.number image_CreatePixelMapFromSurface_Promise_001
     * @tc.desc   surfaceId is''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_001';
      try {
        image.createPixelMapFromSurface('').then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertUndefined();
        });
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFalse();
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_002
     * @tc.number image_CreatePixelMapFromSurface_Promise_002
     * @tc.desc   surfaceId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_002';
      try {
        image.createPixelMapFromSurface(null).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertUndefined();
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFalse();
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_003
     * @tc.number image_CreatePixelMapFromSurface_Promise_003
     * @tc.desc   surfaceId is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_003';
      try {
        image.createPixelMapFromSurface(undefined).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
          expect(error.code).assertUndefined();
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFalse();
      }
      done();
    })

    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_004
     * @tc.number image_CreatePixelMapFromSurface_Promise_004
     * @tc.desc   surfaceId is indexSurfaceId,region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_004';
      try {
        image.createPixelMapFromSurface(indexSurfaceId,null).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_005
     * @tc.number image_CreatePixelMapFromSurface_Promise_005
     * @tc.desc   surfaceId is indexSurfaceId,region is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_005';
      try {
        image.createPixelMapFromSurface(indexSurfaceId,undefined).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_006
     * @tc.number image_CreatePixelMapFromSurface_Promise_006
     * @tc.desc   surfaceId is indexSurfaceId,region is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_006';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        image.createPixelMapFromSurface(indexSurfaceId,region).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })

    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_007
     * @tc.number image_CreatePixelMapFromSurface_Promise_007
     * @tc.desc   surfaceId is '',region is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_007';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        image.createPixelMapFromSurface('',region).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_008
     * @tc.number image_CreatePixelMapFromSurface_Promise_008
     * @tc.desc   surfaceId is null,region is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_008';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        image.createPixelMapFromSurface(null,region).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_009
     * @tc.number image_CreatePixelMapFromSurface_Promise_009
     * @tc.desc   surfaceId is undefined,region is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_009';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        image.createPixelMapFromSurface(undefined,region).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_010
     * @tc.number image_CreatePixelMapFromSurface_Promise_010
     * @tc.desc   surfaceId is null,region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_010';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        image.createPixelMapFromSurface(null,null).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_011
     * @tc.number image_CreatePixelMapFromSurface_Promise_011
     * @tc.desc   surfaceId is undefined,region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_011';
      try {
        image.createPixelMapFromSurface(undefined,null).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_012
     * @tc.number image_CreatePixelMapFromSurface_Promise_012
     * @tc.desc   surfaceId is '',region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_012';
      try {
        image.createPixelMapFromSurface('',null).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_013
     * @tc.number image_CreatePixelMapFromSurface_Promise_013
     * @tc.desc   surfaceId is '',region is  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_013';
      try {
        image.createPixelMapFromSurface(undefined,undefined).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Promise_014
     * @tc.number image_CreatePixelMapFromSurface_Promise_014
     * @tc.desc   surfaceId is null,region is  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Promise_014';
      try {
        image.createPixelMapFromSurface(null,undefined).then(() => {
          console.info('Succeeded in creating pixelmap from Surface');
        }).catch((error: BusinessError) => {
          console.error(`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        });
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_001
     * @tc.number image_CreatePixelMapFromSurface_Sync_001
     * @tc.desc   surfaceId is''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_001';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync('');
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_002
     * @tc.number image_CreatePixelMapFromSurface_Sync_002
     * @tc.desc   surfaceId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_002';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(null)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_003
     * @tc.number image_CreatePixelMapFromSurface_Sync_003
     * @tc.desc   surfaceId is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_003';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(undefined)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_004
     * @tc.number image_CreatePixelMapFromSurface_Sync_004
     * @tc.desc   indexSurfaceId,region is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_004';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(indexSurfaceId,undefined)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_005
     * @tc.number image_CreatePixelMapFromSurface_Sync_005
     * @tc.desc   indexSurfaceId,region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_005';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(indexSurfaceId,null)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_006
     * @tc.number image_CreatePixelMapFromSurface_Sync_006
     * @tc.desc   indexSurfaceId,region is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_006';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(indexSurfaceId,region)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_007
     * @tc.number image_CreatePixelMapFromSurface_Sync_007
     * @tc.desc   indexSurfaceId is '',region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_007';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync('',region)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_008
     * @tc.number image_CreatePixelMapFromSurface_Sync_008
     * @tc.desc   indexSurfaceId is null,region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_008';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(null,region)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_009
     * @tc.number image_CreatePixelMapFromSurface_Sync_009
     * @tc.desc   indexSurfaceId is undefined,region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_009';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(undefined,region)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('62980178');
      }
      done();
    })

    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_010
     * @tc.number image_CreatePixelMapFromSurface_Sync_010
     * @tc.desc   indexSurfaceId is undefined,region is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_010';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(undefined,undefined)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_011
     * @tc.number image_CreatePixelMapFromSurface_Sync_011
     * @tc.desc   indexSurfaceId is undefined,region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_011';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(undefined,null)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_012
     * @tc.number image_CreatePixelMapFromSurface_Sync_012
     * @tc.desc   indexSurfaceId is null,region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_012';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync(null,null)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_013
     * @tc.number image_CreatePixelMapFromSurface_Sync_013
     * @tc.desc   indexSurfaceId is '',region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_013';
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync('',null)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   image_CreatePixelMapFromSurface_Sync_014
     * @tc.number image_CreatePixelMapFromSurface_Sync_014
     * @tc.desc   indexSurfaceId is '',region is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_CreatePixelMapFromSurface_Sync_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_CreatePixelMapFromSurface_Sync_014';
      let region: image.Region = AppStorage.get('empty') as ESObject;
      try {
        let pixelMap : image.PixelMap = image.createPixelMapFromSurfaceSync('',region)
        console.info(TAG, testName,'Succeeded in creating pixelmap from Surface',pixelMap);
        expect().assertFalse();
      } catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
      }
      done();
    })
  })
}
