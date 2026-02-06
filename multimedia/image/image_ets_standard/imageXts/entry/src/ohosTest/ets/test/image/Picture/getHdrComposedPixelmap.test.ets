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
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getHdrComposedPixelmap';

async function getHdrComposedPixelmapAbnormalPromiseTest(done: Function, testName: string, path: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }

    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let PictureObj: image.Picture | null = await imageSource.createPicture();

    let funcName = "getHdrComposedPixelmap";
    if (PictureObj != null) {
      let hdrComposedPixelmap: image.PixelMap = await PictureObj.getHdrComposedPixelmap();
      if (hdrComposedPixelmap != null) {
        hdrComposedPixelmap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          if (imageInfo != null) {
            console.info(TAG, 'GetMainPixelmap information height:' + imageInfo.size.height + ' width:' +
            imageInfo.size.width);
            done();
          }
        }).catch((error: BusinessError) => {
          console.info(TAG, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail()
          done();
        });
      } else {
        console.info(TAG, `hdrComposedPixelmapis null`, testName, funcName);
        expect().assertFail()
        done();
      }
    } else {
      console.info(TAG, 'PictureObj is null', testName, funcName);
      expect().assertFail()
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect(error?.code == ErrorCode.UNSUPPORTED_METADATA).assertTrue();
    done();
  }
}

export default function getHdrComposedPixelmapTest() {
  describe('getHdrComposedPixelmapTest', () => {

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
     * @tc.number    : PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_001
     * @tc.name      : picture_getHdrComposedPixelmap_abnormal_promise_001
     * @tc.desc      : getHdrComposedPixelmap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('picture_getHdrComposedPixelmap_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getHdrComposedPixelmap_abnormal_promise_001';
      const path = 'test.jpg';
      await getHdrComposedPixelmapAbnormalPromiseTest(done, testName, path);
    })
  })
}