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

import { sendableImage } from '@kit.ImageKit';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';


const TAG = LOG_TAG + 'translate';

async function translateTest(done: Function, testName: string, translateX: number, translateY: number,callback:(isTrue:boolean)=>void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (pixelMap != undefined) {
      await pixelMap.translate(translateX, translateY)
      callback(true)
    }else {
      expect().assertFail();
    }
    done()
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
    done();
  }
}
async function translateAbnormalTest(done: Function, testName: string, translateX: number, translateY: number,callback:(err:ESObject)=>void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    let pixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (pixelMap != undefined) {
      console.info(TAG, testName, `translate  start`);
      await pixelMap.translate(translateX, translateY)
      console.info(TAG, testName, `translate  finish`);
      expect().assertFail();
    } else {
      expect().assertFail();
    }
    done()
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error.code}`);
    callback(error)
    done();
  }
}
export default function SendableImageTranslateTest() {
  describe('SendableImageTranslateTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('keyMap',[1,2,3])
      AppStorage.setOrCreate('keyString','abc')
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
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0001
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0001
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0001';
      let translateX: number = 1;
      let translateY: number = 1;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })
    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0002
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0002
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0002';
      let translateX: number = -1;
      let translateY: number = -1;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })
    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0003
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0003
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0003';
      let translateX: number = 1;
      let translateY: number = -1;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })
    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0004
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0004
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0004';
      let translateX: number = -1;
      let translateY: number = 1;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0005
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0005
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0005';
      let translateX: number = 0;
      let translateY: number = 0;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0006
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0006
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0006';
      let translateX: number = 360;
      let translateY: number = -360;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_TEST_0007
     * @tc.number SENDABLE_IMAGE_TRANSLATE_0007
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_TEST_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_TEST_0007';
      let translateX: number = -720;
      let translateY: number = 720;
      await translateTest(done, testName, translateX, translateY,(isTrue)=>{
        expect(isTrue).assertTrue()
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0001
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0001
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0001';
      let translateX: number = null as ESObject;
      let translateY: number = 1;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0002
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0002
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0002';
      let translateX: number = undefined as ESObject;
      let translateY: number = 1;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0003
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0003
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0003';
      let translateX: number = AppStorage.get('keyMap') as ESObject;
      let translateY: number = 1;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0004
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0004
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0004';
      let translateX: number = AppStorage.get('keyString') as ESObject;
      let translateY: number = 1;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0005
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0005
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0005';
      let translateX: number = 1;
      let translateY: number = null as ESObject;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0006
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0006
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0006';
      let translateX: number = 1;
      let translateY: number = undefined as ESObject;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0007
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0007
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0007';
      let translateX: number = 1;
      let translateY: number = AppStorage.get('keyMap') as ESObject;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })

    /**
     * @tc.name   SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0008
     * @tc.number SENDABLE_IMAGE_TRANSLATE_ABNORMAL_0008
     * @tc.desc   translate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_TRANSLATE_ABNORMAL_TEST_0008';
      let translateX: number = 1;
      let translateY: number = AppStorage.get('keyString') as ESObject;
      await translateAbnormalTest(done, testName, translateX, translateY,(err:ESObject)=>{
        expect(err).assertEqual(62980115)
      });
    })
  })
}