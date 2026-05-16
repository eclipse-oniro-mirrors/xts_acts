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

const TAG = 'CreatePixelMapUsingAllocatorSync1'
let fdNumber: number;

async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

export default function CreatePixelMapUsingAllocatorAndSync() {
  describe('CreatePixelMapUsingAllocatorAndSync', () => {
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
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_001
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_001
     * @tc.desc   Image,createPixelMapUsingAllocator,color:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_001';
      try {
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMapUsingAllocator(null, opts, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_002
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_002
     * @tc.desc   Image,createPixelMapUsingAllocator,color:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_002';
      try {
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMapUsingAllocator(undefined, opts, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_003
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_003
     * @tc.desc   Image,createPixelMapUsingAllocator,color:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_003';
      let color: ArrayBuffer  = AppStorage.get('empty') as ESObject;
      try {
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_004
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_004
     * @tc.desc   Image,createPixelMapUsingAllocator,opts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_004';
      let opts: image.InitializationOptions  = AppStorage.get('empty') as ESObject;
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_005
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_005
     * @tc.desc   Image,createPixelMapUsingAllocator,opts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_005';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        image.createPixelMapUsingAllocator(color, undefined, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_006
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_006
     * @tc.desc   Image,createPixelMapUsingAllocator,opts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_006';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        image.createPixelMapUsingAllocator(color, null, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_007
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_007
     * @tc.desc   Image,createPixelMapUsingAllocator,color:null,opts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_007';
      try {
        image.createPixelMapUsingAllocator(null, null, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_008
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_008
     * @tc.desc   Image,createPixelMapUsingAllocator,color:undefined,opts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_008';
      try {
        image.createPixelMapUsingAllocator(undefined, undefined, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_009
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_009
     * @tc.desc   Image,createPixelMapUsingAllocator,color:null,opts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_009';
      try {
        image.createPixelMapUsingAllocator(null, undefined, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_010
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_010
     * @tc.desc   Image,createPixelMapUsingAllocator,color:undefined,opts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_010';
      try {
        image.createPixelMapUsingAllocator(undefined, null, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Promise_Supp_011
     * @tc.number image_createPixelMapUsingAllocator_Promise_Supp_011
     * @tc.desc   Image,createPixelMapUsingAllocator,color:'',opts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Promise_Supp_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Promise_Supp_011';
      let opts: image.InitializationOptions  = AppStorage.get('empty') as ESObject;
      let color:ArrayBuffer = AppStorage.get('empty') as ESObject;
      try {
        image.createPixelMapUsingAllocator(color, opts, image.AllocatorType.AUTO).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName,'Succeeded in creating pixelmap.');
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })

    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_001
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_001
     * @tc.desc   Image,createPixelMapUsingAllocator,color:'',opts:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_001';
      let opts: image.InitializationOptions  = AppStorage.get('empty') as ESObject;
      let color:ArrayBuffer = AppStorage.get('empty') as ESObject;
      try {
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })

    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_002
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_002
     * @tc.desc   Image,createPixelMapUsingAllocator,color:undefined,opts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_002';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(undefined, undefined, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_003
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_003
     * @tc.desc   Image,createPixelMapUsingAllocator,color:undefined,opts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_003';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(undefined, null, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_004
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_004
     * @tc.desc   Image,createPixelMapUsingAllocator,color:null,opts:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_004';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(null, undefined, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_005
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_005
     * @tc.desc   Image,createPixelMapUsingAllocator,color:null,opts:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_005';
      try {
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(null, null, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_006
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_006
     * @tc.desc   Image,createPixelMapUsingAllocator,color:'',
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_006';
      let color:ArrayBuffer = AppStorage.get('empty') as ESObject;
      try {
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_007
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_007
     * @tc.desc   Image,createPixelMapUsingAllocator,color:null,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_007';
      try {
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(null, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_008
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_008
     * @tc.desc   Image,createPixelMapUsingAllocator,color:undefined,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_008';
      try {
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(undefined, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_009
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_009
     * @tc.desc   Image,createPixelMapUsingAllocator,opts:'',
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_009';
      let opts: image.InitializationOptions  = AppStorage.get('empty') as ESObject;
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_010
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_010
     * @tc.desc   Image,createPixelMapUsingAllocator,opts:null,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_010';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, null, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocator_Sync_Supp_011
     * @tc.number image_createPixelMapUsingAllocator_Sync_Supp_011
     * @tc.desc   Image,createPixelMapUsingAllocator,opts:undefined,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocator_Sync_Supp_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocator_Sync_Supp_011';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, undefined, image.AllocatorType.AUTO);
        console.info(TAG, testName,'Succeeded in creating pixelmap.',pixelMap);
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('7600201');
      }
      done();
    })
  })
}