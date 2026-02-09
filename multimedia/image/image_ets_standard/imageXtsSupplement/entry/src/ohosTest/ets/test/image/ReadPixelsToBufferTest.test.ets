/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';

const TAG = 'ImageXts.ReadPixelsToBuffer';

export default function ReadPixelsToBufferSupp() {
  describe('ReadPixelsToBuffer', () => {
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
     * @tc.number     SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_001
     * @tc.name       SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_001
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_001', Level.LEVEL1, async (done:Function) => {
      const testName = 'SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_001';
      const pathUri ='test_exif_v2.jpg';
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
        let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
        console.info(TAG, testName, `pixelmap创建成功`);
        exifCommodityPixelMap.readPixelsToBuffer(null).then(() => {
          console.info(TAG, testName,'Succeeded in reading image pixel data.');
          expect(exifCommodityPixelMap != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to read image pixel data.code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_002
     * @tc.name       SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_002
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_002', Level.LEVEL1, async (done:Function) => {
      const testName = 'SUB_MEDIA_READ_PIXELS_TO_BUFFER_TEST_002';
      const pathUri ='test_exif_v2.jpg';
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
        let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
        console.info(TAG, testName, `pixelmap创建成功`);
        exifCommodityPixelMap.readPixelsToBuffer(undefined).then(() => {
          console.info(TAG, testName,'Succeeded in reading image pixel data.');
          expect(exifCommodityPixelMap != null).assertTrue();
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to read image pixel data.code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
      }
      done();
    })
  })
}


