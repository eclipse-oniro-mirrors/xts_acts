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

import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = 'createImageSourceSupp';

async function createImageSourcePromiseTest(done: Function, testName: string, pathUri: string,callback: (err: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(30000);
    let path = `file://${testContext.filesDir}/${pathUri}`;``
    const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    await fs.close(fd);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    expect(imageSource !== undefined).assertTrue()
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error),error.code,testName);
    callback(error.code);
    done();
  }
}

async function createImageSourceAbnormalPromiseTest(done: Function, testName: string, pathUri: string,callback: (err: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(30000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    await fs.close(fd);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    expect(imageSource !== undefined).assertTrue()
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error),error.code,testName);
    callback(error.code);
    done();
  }
}


async function createImageSourceOptionsPromiseTest(done: Function, testName: string, pathUri: string,callback: (err: number) => void,
  SourceOptions: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(30000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    await fs.close(fd);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let imageSource: image.ImageSource = image.createImageSource(array, SourceOptions);
    expect(imageSource !== undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code,error.code,testName);
    callback(error.code);
    done();
  }
}

async function createImageSourceOptionsPromiseAbnormalTest(done: Function, testName: string, pathUri: string,callback: (err: number) => void,
  SourceOptions: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(30000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, array);
    await fs.close(fd);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let imageSource: image.ImageSource = image.createImageSource(array, SourceOptions);
    expect(imageSource !== undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code,error.code,testName);
    callback(error.code);
    done();
  }
}


export default function createImageSourceTest() {
  describe('createImageSourceTest',  () => {

    beforeAll(async () => {
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
     * @tc.name   createImageSource_promise_001
     * @tc.number createImageSource_promise_001
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_001';
      const path = 'test.jpg';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_002
     * @tc.number createImageSource_promise_002
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_002';
      const path = 'test.png';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_003
     * @tc.number createImageSource_promise_003
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_003';
      const path = 'test.gif';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_004
     * @tc.number createImageSource_promise_004
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_004';
      const path = 'test.bmp';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_005
     * @tc.number createImageSource_promise_005
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_005';
      const path = 'test.webp';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_006
     * @tc.number createImageSource_promise_006
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_006';
      const path = 'test.dng';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_007
     * @tc.number createImageSource_promise_007
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_007';
      const path = 'test_aisr.heic';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_008
     * @tc.number createImageSource_promise_008
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_008';
      const path = 'test.svg';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_009
     * @tc.number createImageSource_promise_009
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_009';
      const path = 'test.ico';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_010
     * @tc.number createImageSource_promise_010
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_010';
      const path = 'test.123';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_011
     * @tc.number createImageSource_promise_011
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_011';
      const path = 'test.arw';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_012
     * @tc.number createImageSource_promise_012
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_012';
      const path = 'test.cr2';
      await createImageSourcePromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_013
     * @tc.number createImageSource_promise_013
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_013';
      const path = 'test.cr3';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_014
     * @tc.number createImageSource_promise_014
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_014';
      const path = 'test.jpeg';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_015
     * @tc.number createImageSource_promise_015
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_015';
      const path = 'test.nrw';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_016
     * @tc.number createImageSource_promise_016
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_016';
      const path = 'mimeType_test.orf';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_017
     * @tc.number createImageSource_promise_017
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_017';
      const path = 'test.pef';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_018
     * @tc.number createImageSource_promise_018
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_018';
      const path = 'test.raf';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_019
     * @tc.number createImageSource_promise_019
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_019';
      const path = 'test.rw2';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_020
     * @tc.number createImageSource_promise_020
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_020';
      const path = 'mimeType_test.srw';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createImageSource_promise_021
     * @tc.number createImageSource_promise_021
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_021';
      const path = 'test.tiff';
      await createImageSourceAbnormalPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name   createImageSource_promise_022
     * @tc.number createImageSource_promise_022
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_022', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_022';
      const path = 'test.jpg';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_023
     * @tc.number createImageSource_promise_023
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_023', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_023';
      const path = 'test.png';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_024
     * @tc.number createImageSource_promise_024
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_024', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_024';
      const path = 'test.gif';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_025
     * @tc.number createImageSource_promise_025
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_025', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_025';
      const path = 'test.bmp';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_026
     * @tc.number createImageSource_promise_026
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_026', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_026';
      const path = 'test.webp';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_027
     * @tc.number createImageSource_promise_027
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_027', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_027';
      const path = 'test.dng';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_028
     * @tc.number createImageSource_promise_028
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_028', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_028';
      const path = 'test_aisr.heic';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_029
     * @tc.number createImageSource_promise_029
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_029', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_029';
      const path = 'test.svg';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_030
     * @tc.number createImageSource_promise_030
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_030', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_030';
      const path = 'test.ico';
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_031
     * @tc.number createImageSource_promise_031
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_031', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_031';
      const path = 'test.123';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_032
     * @tc.number createImageSource_promise_032
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_032', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_032';
      const path = 'test.arw';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_033
     * @tc.number createImageSource_promise_033
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_033', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_033';
      const path = 'test.cr2';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_034
     * @tc.number createImageSource_promise_034
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_034', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_034';
      const path = 'test.cr3';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_035
     * @tc.number createImageSource_promise_035
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_035', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_035';
      const path = 'test.jpeg';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_036
     * @tc.number createImageSource_promise_036
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_036', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_036';
      const path = 'test.nrw';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_037
     * @tc.number createImageSource_promise_037
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_037', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_037';
      const path = 'mimeType_test.orf';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_038
     * @tc.number createImageSource_promise_038
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_038', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_038';
      const path = 'test.pef';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_039
     * @tc.number createImageSource_promise_039
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_039', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_039';
      const path = 'test.raf';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_040
     * @tc.number createImageSource_promise_040
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_040', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_040';
      const path = 'test.rw2';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_041
     * @tc.number createImageSource_promise_041
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_041', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_041';
      const path = 'mimeType_test.srw';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.name   createImageSource_promise_042
     * @tc.number createImageSource_promise_042
     * @tc.desc   createImageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImageSource_promise_042', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100 } };
      const testName = 'createImageSource_promise_042';
      const path = 'test.tiff';
      await createImageSourceOptionsPromiseAbnormalTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })


  })
}