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

import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'getGainmapPixelmap';

async function getGainmapPixelmapPromiseTest(done: Function, testName: string, path: string, callback: (data: image.PixelMap | null) => void) {
  try {
    console.info(TAG, testName, `getGainmapPixelmapAbnormalPromiseTest start`);
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let uri = `file://${testContext.filesDir}/${path}`;
    console.info(TAG, testName, `createImageSource start`);
    let imageSource: image.ImageSource = image.createImageSource(uri);
    console.info(TAG, testName, `imageSource: ${JSON.stringify(imageSource)}`);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    console.info(TAG, testName, `commodityPixelMap: ${JSON.stringify(commodityPixelMap)}`);
    let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
    console.info(TAG, testName, `PictureObj:`,JSON.stringify(PictureObj));
    if (PictureObj != null) {
      let gainPixelmap: image.PixelMap | null = PictureObj.getGainmapPixelmap();
      console.info(TAG, testName, `gainPixelmap:`,JSON.stringify(gainPixelmap));
      callback(gainPixelmap);
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function PictureGetGainmapPixelmapTest() {
  describe('PictureGetGainmapPixelmapTest', () => {

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
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0001
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0001
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0001';
      const path = 'test_exif_v2.jpg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0002
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0002
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0002';
      const path = 'test.gif';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0003
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0003
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0003';
      const path = 'test.ico';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0004
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0004
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0004';
      const path = 'test.jpeg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0005
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0005
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0005';
      const path = 'test.jpg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0006
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0006
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0006';
      const path = 'test.png';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0007
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0007
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0007';
      const path = 'test.svg';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0008
     * @tc.number SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0008
     * @tc.desc   getGainmapPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PICTURE_GET_GAIN_MAP_PIXEL_MAP_0008';
      const path = 'test.webp';
      await getGainmapPixelmapPromiseTest(done, testName, path, (data: image.PixelMap | null) => {
        expect(data).assertUndefined();
      });
    })
  })
}