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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getMainPixelmap';

async function getMainPixelmapPromiseTest(done: Function, testName: string, path: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const resourceMgr = testContext.resourceManager;
  const rawFile = await resourceMgr.getRawFileContent(path);
  let ops: image.SourceOptions = {
    sourceDensity: 98,
  }
  let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
  let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
  let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
  let funcName = "getMainPixelmap";
  if (pictureObj != null) {
    let mainPixelmap: image.PixelMap = pictureObj.getMainPixelmap();
    if (mainPixelmap != null) {
      mainPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
        if (imageInfo != null) {
          console.info('GetMainPixelmap information height:' + imageInfo.size.height + ' width:' +
          imageInfo.size.width);
          done();
        }
      }).catch((error: BusinessError) => {
        console.error(funcName, 'Failed error.code: ${error.code} ,error.message: ${error.message}');
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail()
        done();
      });
    }
  } else {
    console.info(TAG, 'PictureObj is null');
    expect().assertFail();
    done();
  }
}

export default function PictureGetMainPixelMapTest() {
  describe('PictureGetMainPixelMapTest', () => {

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
     * @tc.name   picture_getMainPixelmap_promise_001
     * @tc.number PICTURE_GET_MAIN_PIXEL_MAP_001
     * @tc.desc   getMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMainPixelmap_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMainPixelmap_promise_001';
      const path = 'test.jpg';
      await getMainPixelmapPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   picture_getMainPixelmap_promise_002
     * @tc.number PICTURE_GET_MAIN_PIXEL_MAP_002
     * @tc.desc   getMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMainPixelmap_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMainPixelmap_promise_002';
      const path = 'test.svg';
      await getMainPixelmapPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   picture_getMainPixelmap_promise_003
     * @tc.number PICTURE_GET_MAIN_PIXEL_MAP_003
     * @tc.desc   getMainPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMainPixelmap_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMainPixelmap_promise_003';
      const path = 'AllAuxiliaryPictures.jpg';
      await getMainPixelmapPromiseTest(done, testName, path);
    })
  })
}