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
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'getType';

async function pixelmapScaleTest(done: Function, testName: string, scaleX: number, scaleY: number,
  callback: (isTrue: boolean) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let pathUri = 'test.jpg'
    let auxBuffer = new ArrayBuffer(3000);
    let path = 'file://' + testContext.filesDir + "/" + pathUri;
    const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, auxBuffer);
    console.info(TAG, testName, `readLength: ${readLength}`);
    await fs.close(fd);
    let buf = image.createImageSource(auxBuffer)
    let decodingOptions: image.DecodingOptions = {
      editable: true,
      desiredSize: { width: 100, height: 100 },
      desiredPixelFormat: 3
    };
    let pixelMap: image.PixelMap = await buf.createPixelMap(decodingOptions);
    console.info(testName, 'zl------------PixelMap创建成功');
    if (pixelMap !== undefined) {
      await pixelMap.scale(scaleX, scaleY)
      console.info(testName, 'zl------------Succeeded in scaling pixelmap.');
      callback(true)
      done();
    }
  } catch (err) {
    const error = err as BusinessError;
    console.error(testName, 'zl------------------Failed to scale pixelmap. code:', error.code, 'message is', error.message);
    expect().assertFail();
  }
}

async function sendableImageScaleAbnormalTest(done: Function, testName: string, scaleX: number, scaleY: number,
  callback: (isTrue: boolean) => void) {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let pathUri = 'test.jpg'
    let auxBuffer = new ArrayBuffer(3000);
    let path = 'file://' + testContext.filesDir + "/" + pathUri;
    const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let readLength = await fs.read(fd.fd, auxBuffer);
    console.info(TAG, testName, `readLength: ${readLength}`);
    await fs.close(fd);
    let buf = image.createImageSource(auxBuffer)
    let decodingOptions: image.DecodingOptions = {
      editable: true,
      desiredSize: { width: 100, height: 100 },
      desiredPixelFormat: 3
    };
    let pixelMap: image.PixelMap = await buf.createPixelMap(decodingOptions);
    console.info(testName, 'createPixelMap success');
  try {
    if (pixelMap !== undefined) {
      await pixelMap.scale(scaleX, scaleY)
      console.info(testName, 'Succeeded in scaling pixelmap.');
      expect().assertFail();
    }
  } catch (err) {
    const error = err as BusinessError;
    console.error(testName, 'Failed to scale pixelmap. code:', error.code, 'message is', error.message);
    callback(false)
    done();
  }
}

export default function SendableImageScale() {
  describe('SendableImageScale', () => {

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
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0001
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0001
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0001';
      let scaleX: number = 1;
      let scaleY: number = 1;
      await pixelmapScaleTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(true);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0002
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0002
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0002';
      let scaleX: number = 1000;
      let scaleY: number = 1000;
      await pixelmapScaleTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(true);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0003
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0003
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0003';
      let scaleX: number = 1000;
      let scaleY: number = 1;
      await pixelmapScaleTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(true);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0004
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0004
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0004';
      let scaleX: number = 1;
      let scaleY: number = 1000;
      await pixelmapScaleTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(true);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0005
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0005
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0005';
      let scaleX: number = null as ESObject;
      let scaleY: number = 1;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0006
     * @tc.number PIXELMAPSCALETEST_PROMISE_0006
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0006';
      let scaleX: number = undefined as ESObject;
      let scaleY: number = 1;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0007
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0007
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0007';
      let scaleX: number = AppStorage.get('keyMap') as ESObject;
      let scaleY: number = 1;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0008
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0008
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0008';
      let scaleX: number = AppStorage.get('keyString') as ESObject;
      let scaleY: number = 1;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0009
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0009
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0009';
      let scaleX: number = 1;
      let scaleY: number = null as ESObject;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0010
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0010
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0010';
      let scaleX: number = 1;
      let scaleY: number = undefined as ESObject;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0011
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0011
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0011';
      let scaleX: number = 1;
      let scaleY: number = AppStorage.get('keyMap') as ESObject;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_SCALE_TEST_0012
     * @tc.number SENDABLE_IMAGE_SCALE_TEST_0012
     * @tc.desc   getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_SCALE_TEST_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SCALE_TEST_0012';
      let scaleX: number = 1;
      let scaleY: number = AppStorage.get('keyMap') as ESObject;
      await sendableImageScaleAbnormalTest(done, testName, scaleX, scaleY, (isTrue) => {
        expect(isTrue).assertEqual(false);
      });
    })

  })
}