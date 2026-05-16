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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import { common } from '@kit.AbilityKit';

const TAG = LOG_TAG + 'createPixelMapSync';

async function createPixelMapSyncAbnormalTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions, callback: (errorCode: ESObject) => void) {
  try {
    console.info(TAG, testName, `createPixelMapSync start`);
    let pixelMap = await image.createPixelMapSync(color, opts);
    console.info(TAG, testName, `createPixelMapSync end`);
    console.info(TAG, testName, `pixelMap`, JSON.stringify(pixelMap));
    if (pixelMap == undefined) {
      callback(pixelMap)
    } else {
      expect().assertFail();
    }
    done();
  } catch (error) {
    console.info(TAG, testName, 'failed; error:',error, 'errorCode :' ,error.code);
    callback(error.code)
    done();
  }
}

export default function ImageCreatePixelMapSyncAbnormalTest() {
  describe('ImageCreatePixelMapSyncAbnormalTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('keyMap', [])
      AppStorage.setOrCreate('keyString', 'abc')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0001
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0001
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0001';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        size: { height: 4, width: 6 },
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0002
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0002
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0002';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0003
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0003
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0003';
      const color: ArrayBuffer = AppStorage.get('keyMap') as ESObject;
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0004
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0004
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0004';
      const color: ArrayBuffer = AppStorage.get('keyString') as ESObject;
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0005
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0005
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: null as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0006
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0006
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: undefined as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0007
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0007
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: AppStorage.get('keyMap') as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0008
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0008
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: AppStorage.get('keyString') as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0009
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0009
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: -1 as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0010
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0010
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: -10000 as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0011
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0011
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 0 as ESObject, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0012
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0012
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: null as ESObject },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0013
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0013
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: undefined as ESObject },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0014
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0014
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: AppStorage.get('keyMap') as ESObject },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0015
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0015
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: AppStorage.get('keyString') as ESObject },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0016
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0016
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: -1 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0017
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0017
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: -10000 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_00018
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0018
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_00018', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 0 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0019
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0019
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        size: null as ESObject,
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0020
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0020
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0200';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        size: undefined as ESObject,
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0021
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0021
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0021';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        size: AppStorage.get('keyMap') as ESObject,
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0022
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0022
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0022';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        size: AppStorage.get('keyString') as ESObject,
      };
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0023
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0023
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0023';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0024
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0024
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0024';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
        
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0025
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0025
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0025';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = AppStorage.get('keyMap') as ESObject;
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
      });
    })

    /**
     * @tc.name   CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0026
     * @tc.number CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0026
     * @tc.desc   Test createPixelMapSync with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'CREATE_PIXELMAP_SYNC_ABNORMAL_TEST_0026';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = AppStorage.get('keySting') as ESObject;
      await createPixelMapSyncAbnormalTest(done, testName, color, opts, (errorCode: ESObject) => {
        expect(errorCode).assertUndefined()
      });
    })
  })
}