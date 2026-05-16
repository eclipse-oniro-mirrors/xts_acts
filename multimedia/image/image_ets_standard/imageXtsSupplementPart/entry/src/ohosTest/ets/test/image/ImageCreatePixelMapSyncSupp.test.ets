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

const TAG = 'Image.ImageCreatePixelMapSyncSupp'
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

export default function ImageCreatePixelMapSync() {
  describe('ImageCreatePixelMapSync', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });


    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_001
     * @tc.number image_createPixelMapSync_InitializationOptions_001
     * @tc.desc   image_createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_001';
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_002
     * @tc.number image_createPixelMapSync_InitializationOptions_002
     * @tc.desc   imageS_createPixelMapSync  editable:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_002';
      AppStorage.setOrCreate('key', null);
      let editable: boolean = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          editable: editable,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_003
     * @tc.number image_createPixelMapSync_InitializationOptions_003
     * @tc.desc   imageS_createPixelMapSync  editable:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_003';
      AppStorage.setOrCreate('key', undefined);
      let editable: boolean = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          editable: editable,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_004
     * @tc.number image_createPixelMapSync_InitializationOptions_004
     * @tc.desc   imageS_createPixelMapSync  editable:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_004';
      AppStorage.setOrCreate('key', '');
      let editable: boolean = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          editable: editable,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_005
     * @tc.number image_createPixelMapSync_InitializationOptions_005
     * @tc.desc   imageS_createPixelMapSync  editable:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_005';
      AppStorage.setOrCreate('key', '');
      let editable: image.InitializationOptions = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = editable;
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_006
     * @tc.number image_createPixelMapSync_InitializationOptions_006
     * @tc.desc   imageS_createPixelMapSync  editable:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_006';
      AppStorage.setOrCreate('key', undefined);
      let editable: image.InitializationOptions = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = editable;
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_007
     * @tc.number image_createPixelMapSync_InitializationOptions_007
     * @tc.desc   imageS_createPixelMapSync  editable:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_007';
      AppStorage.setOrCreate('key', null);
      let editable: image.InitializationOptions = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = editable;
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_008
     * @tc.number image_createPixelMapSync_InitializationOptions_008
     * @tc.desc   imageS_createPixelMapSync  alphaType:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_008';
      AppStorage.setOrCreate('key', '');
      let alphaType: image.AlphaType = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          alphaType: alphaType,
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_009
     * @tc.number image_createPixelMapSync_InitializationOptions_009
     * @tc.desc   imageS_createPixelMapSync  alphaType:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_009';
      AppStorage.setOrCreate('key', null);
      let alphaType: image.AlphaType = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          alphaType: alphaType,
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   image_createPixelMapSync_InitializationOptions_010
     * @tc.number image_createPixelMapSync_InitializationOptions_010
     * @tc.desc   imageS_createPixelMapSync  alphaType:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapSync_InitializationOptions_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapSync_InitializationOptions_010';
      AppStorage.setOrCreate('key', undefined);
      let alphaType: image.AlphaType = AppStorage.get('key') as ESObject;
      const imageSourceApi = await getImageSource('test.jpg');
      try {
        let opts: image.InitializationOptions = {
          alphaType: alphaType,
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap: image.PixelMap = imageSourceApi.createPixelMapSync(opts);
        console.info(TAG, testName, `createPixelMapSync success`, pixelMap);
        expect(pixelMap!= undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
      }
      done()
    })


    /**
     * @tc.name   image_createPixelMapUsingAllocatorSync_InitializationOptions_001
     * @tc.number image_createPixelMapUsingAllocatorSync_InitializationOptions_001
     * @tc.desc   first input parameters color:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocatorSync_InitializationOptions_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocatorSync_InitializationOptions_001';
      AppStorage.setOrCreate('key', '');
      let color: ArrayBuffer  = AppStorage.get('key') as ESObject;
      try {
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,`createPixelMapUsingAllocatorSync success`, pixelMap);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('7600201');
      }
      done()
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocatorSync_InitializationOptions_002
     * @tc.number image_createPixelMapUsingAllocatorSync_InitializationOptions_002
     * @tc.desc   first input parameters color:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocatorSync_InitializationOptions_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocatorSync_InitializationOptions_002';
      try {
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(null, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,`createPixelMapUsingAllocatorSync success`, pixelMap);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('7600201');
      }
      done()
    })
    /**
     * @tc.name   image_createPixelMapUsingAllocatorSync_InitializationOptions_003
     * @tc.number image_createPixelMapUsingAllocatorSync_InitializationOptions_003
     * @tc.desc   first input parameters color:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPixelMapUsingAllocatorSync_InitializationOptions_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPixelMapUsingAllocatorSync_InitializationOptions_003';
      try {
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        let pixelMap : image.PixelMap = image.createPixelMapUsingAllocatorSync(undefined, opts, image.AllocatorType.AUTO);
        console.info(TAG, testName,`createPixelMapUsingAllocatorSync success`, pixelMap);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, `failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('7600201');
      }
      done()
    })

    /**
     * @tc.name   image_createPremultipliedPixelMap_callback_001
     * @tc.number image_createPremultipliedPixelMap_callback_001
     * @tc.desc   first input parameters color:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_callback_001';
      try {
        let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(undefined, dstPixelMap, (error: BusinessError) => {
          if(error) {
            console.error(`Failed to convert pixelmap, error code is ${error}`);
            return;
          } else {
            console.info('Succeeded in converting pixelmap.');
          }
        })
      }catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_callback_002
     * @tc.number image_createPremultipliedPixelMap_callback_002
     * @tc.desc   first input parameters color:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_callback_002';
      try {
        let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(null, dstPixelMap, (error: BusinessError) => {
          if(error) {
            console.error(`Failed to convert pixelmap, error code is ${error}`);
            return;
          } else {
            console.info('Succeeded in converting pixelmap.');
          }
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_callback_003
     * @tc.number image_createPremultipliedPixelMap_callback_003
     * @tc.desc   first input parameters color:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_callback_003';
      AppStorage.setOrCreate('key', '');
      let srcPixelmap: 	PixelMap  = AppStorage.get('key') as ESObject;
      try {
        let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
          if(error) {
            console.error(`Failed to convert pixelmap, error code is ${error}`);
            return;
          } else {
            console.info('Succeeded in converting pixelmap.');
          }
      })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })

    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_001
     * @tc.number image_createPremultipliedPixelMap_promise_001
     * @tc.desc   first input parameters srcPixelmap:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_001';
      try {
        let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(undefined, dstPixelMap).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_002
     * @tc.number image_createPremultipliedPixelMap_promise_002
     * @tc.desc   first input parameters srcPixelmap:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_002';
      try {
        let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(null, dstPixelMap).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })

      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_003
     * @tc.number image_createPremultipliedPixelMap_promise_003
     * @tc.desc   first input parameters srcPixelmap:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_003';
      AppStorage.setOrCreate('key', '');
      let srcPixelmap: 	PixelMap  = AppStorage.get('key') as ESObject;
      try {
        let optsForPre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.PREMUL}
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_004
     * @tc.number image_createPremultipliedPixelMap_promise_004
     * @tc.desc   sec input parameters dstPixelMap:''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_004';
      AppStorage.setOrCreate('key', '');
      let dstPixelMap: 	PixelMap  = AppStorage.get('key') as ESObject;
      const color: ArrayBuffer = new ArrayBuffer(16);
      try {
        let optsForUnpre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })

    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_005
     * @tc.number image_createPremultipliedPixelMap_promise_005
     * @tc.desc   sec input parameters dstPixelMap:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(16);
      try {
        let optsForUnpre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        image.createPremultipliedPixelMap(srcPixelmap, null).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_006
     * @tc.number image_createPremultipliedPixelMap_promise_006
     * @tc.desc   sec input parameters dstPixelMap:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(16);
      try {
        let optsForUnpre: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 2, width: 2 } , alphaType: image.AlphaType.UNPREMUL}
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        image.createPremultipliedPixelMap(srcPixelmap, undefined).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_007
     * @tc.number image_createPremultipliedPixelMap_promise_007
     * @tc.desc   all input parameters dstPixelMap:undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_007';
      try {
        image.createPremultipliedPixelMap(undefined, undefined).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_008
     * @tc.number image_createPremultipliedPixelMap_promise_008
     * @tc.desc   all input parameters dstPixelMap:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_008';
      try {
        image.createPremultipliedPixelMap(null, null).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
    /**
     * @tc.name   image_createPremultipliedPixelMap_promise_009
     * @tc.number image_createPremultipliedPixelMap_promise_009
     * @tc.desc   all input parameters dstPixelMap:null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_createPremultipliedPixelMap_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_createPremultipliedPixelMap_promise_009';
      AppStorage.setOrCreate('key', '');
      let dstPixelMap: 	PixelMap  = AppStorage.get('key') as ESObject;
      let srcPixelmap: 	PixelMap  = AppStorage.get('key') as ESObject;
      try {
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap).then(() => {
          console.info(TAG, testName,'Succeeded in converting pixelmap.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName,`Failed to convert pixelmap, error code is ${error}`);
        })
      }catch (error) {
        console.error(TAG, testName,`failed; error: ${error},${error.code}`);
        expect(error.code).assertUndefined();
      }
      done()
    })
  })
}
