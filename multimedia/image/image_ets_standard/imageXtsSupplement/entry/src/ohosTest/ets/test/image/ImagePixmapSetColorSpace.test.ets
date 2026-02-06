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
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'setColorSpaceSupp.xts';

async function imagePixelMapCreateTest(done: Function, testName: string,
  callback: (imagePixelMap: image.PixelMap) => void) {
  let opts: image.InitializationOptions =
    { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
  const color: ArrayBuffer =
    new ArrayBuffer(opts.size.height * opts.size.height * 4);
  let imagePixelMap: image.PixelMap = await image.createPixelMap(color, opts);
  if (imagePixelMap != undefined) {
    console.info(TAG, testName, 'Success createPixelMap');
    callback(imagePixelMap);
    return;
  }
  console.info(TAG, testName, 'Failed createPixelMap');
  expect().assertFail();
  done();
}

export default function ImagePixmapSetColorSpaceTest() {
  describe('ImagePixmapSetColorSpaceTest', () => {
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
     * @tc.number     SUB_PIXELMAP_SET_COLOR_SPACE_0100
     * @tc.name       SUB_PIXELMAP_SET_COLOR_SPACE_0100
     * @tc.desc       PixelMap_setColorSpace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PIXELMAP_SET_COLOR_SPACE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PIXELMAP_SET_COLOR_SPACE_0100';
      try {
        console.info(TAG, testName, 'Start');
        await imagePixelMapCreateTest(done, testName, (imagePixelMap) => {
          imagePixelMap.setColorSpace(null);
        })
        console.info(TAG, testName, 'Success setColorSpace');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setColorSpace', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980115');
        done();
      }
    })

    /**
     * @tc.number     SUB_PIXELMAP_SET_COLOR_SPACE_0200
     * @tc.name       SUB_PIXELMAP_SET_COLOR_SPACE_0200
     * @tc.desc       PixelMap_setColorSpace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PIXELMAP_SET_COLOR_SPACE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PIXELMAP_SET_COLOR_SPACE_0200';
      try {
        console.info(TAG, testName, 'Start');
        await imagePixelMapCreateTest(done, testName, (imagePixelMap) => {
          imagePixelMap.setColorSpace(undefined);
        })
        console.info(TAG, testName, 'Success setColorSpace');
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setColorSpace', JSON.stringify(error), error.code);
        expect(error.code).assertEqual('62980115');
        done();
      }
    })

    /**
     * @tc.number     SUB_PIXELMAP_APPLY_COLOR_SPACE_0100
     * @tc.name       SUB_PIXELMAP_APPLY_COLOR_SPACE_0100
     * @tc.desc       PixelMap_setColorSpace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PIXELMAP_APPLY_COLOR_SPACE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PIXELMAP_APPLY_COLOR_SPACE_0100';
      console.info(TAG, testName, 'Start');
      await imagePixelMapCreateTest(done, testName, async (imagePixelMap) => {
        try {
          await imagePixelMap.applyColorSpace(null);
          console.info(TAG, testName, 'Success applyColorSpace')
          expect().assertFail();
          done();
        } catch (err) {
          console.error(TAG, testName, 'Failed applyColorSpace ' + err)
          expect(err).assertEqual(62980115);
          done();
        }
      })
    })

    /**
     * @tc.number     SUB_PIXELMAP_APPLY_COLOR_SPACE_0200
     * @tc.name       SUB_PIXELMAP_APPLY_COLOR_SPACE_0200
     * @tc.desc       PixelMap_setColorSpace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PIXELMAP_APPLY_COLOR_SPACE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PIXELMAP_APPLY_COLOR_SPACE_0200';
      await imagePixelMapCreateTest(done, testName, async (imagePixelMap) => {
        try {
          await imagePixelMap.applyColorSpace(undefined);
          console.info(TAG, testName, 'Success applyColorSpace')
          expect().assertFail();
          done();
        } catch (err) {
          console.error(TAG, testName, 'Failed applyColorSpace ' + err)
          expect(err).assertEqual(62980115);
          done();
        }
      })
    })

    /**
     * @tc.number     SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0100
     * @tc.name       SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0100
     * @tc.desc       PixelMap_setColorSpace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0100';
      console.info(TAG, testName, 'Start');
      await imagePixelMapCreateTest(done, testName, async (imagePixelMap) => {
        try {
          await imagePixelMap.applyColorSpace(null, (error) => {
            if (error) {
              console.error(TAG, testName, `ApplyColorSpace failed`, error);
              expect(error).assertEqual(62980115);
              done();
            } else {
              console.info(TAG, testName, "Succeeded ApplyColorSpace.");
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          console.error(TAG, testName, 'Failed applyColorSpace ' + err)
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.number     SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0200
     * @tc.name       SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0200
     * @tc.desc       PixelMap_setColorSpace
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PIXELMAP_APPLY_COLOR_SPACE_CALLBACK_0200';
      await imagePixelMapCreateTest(done, testName, async (imagePixelMap) => {
        try {
          await imagePixelMap.applyColorSpace(undefined, (error) => {
            if (error) {
              console.error(TAG, testName, `ApplyColorSpace failed`, error);
              expect(error).assertEqual(62980115);
              done();
            } else {
              console.info(TAG, testName, "Succeeded ApplyColorSpace.");
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          console.error(TAG, testName, 'Failed applyColorSpace ' + err)
          expect().assertFail();
          done();
        }
      })
    })
  })
}