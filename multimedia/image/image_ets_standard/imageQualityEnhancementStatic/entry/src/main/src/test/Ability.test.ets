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

import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level } from '../../../hypium/index';
import { initialize } from './AbilityContextHelper.test';

let sleep = async (delay: int): Promise<int> => {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, delay);
  });
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let filesDir: string | undefined | null;
    let filePath: string = "";
    let fdNumber: int = 0;
    let globalPixelMap: image.PixelMap | undefined = undefined;
    let result: boolean = false;

    const getFd = async (fileName: string) => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      fdNumber = file.fd as int;
      console.info("@@@ image case open fd success " + fdNumber);
      await sleep(100);
    };

    const getTestResult = async (TAG: string, decodingDynamicRange: image.DecodingDynamicRange) => {
      result = false;
      const imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(TAG + " @@@ create image source failed");
      } else {
        let decodingOptions: image.DecodingOptions = {
          desiredDynamicRange: decodingDynamicRange
        };
        try {
          let pixelMap = await imageSourceApi.createPixelMap(decodingOptions);
          if (pixelMap == undefined) {
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' createPixelMap failed, pixelMap is undefined!');
          } else {
            globalPixelMap = pixelMap!;
            try {
              let imageInfo = await pixelMap.getImageInfo();
              hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo:' + JSON.stringify(imageInfo));
              let isHDR = imageInfo.isHdr;
              let pixelmapFormat = imageInfo.pixelFormat;
              hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' isHDR value: ' + JSON.stringify(isHDR));
              hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' pixelmapFormat value: ' + JSON.stringify(pixelmapFormat));
              result = true;
            } catch (err: BusinessError) {
              hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' getImageInfo err ' + JSON.stringify(err));
            }
          }
        } catch (error: BusinessError) {
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' createPixelMap err ' + JSON.stringify(error));
        }
      }
    }

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await initialize();
      filesDir = Hypium.get('filesDir') as string;
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The int of execution times is the same as the int of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      if (globalPixelMap != undefined) {
        console.info("@@@ globalpixelmap release start");
        try {
          await globalPixelMap!.release();
        } catch (error) {
          console.error("@@@ globalpixelmap release fail");
        }
      }
      // Presets a clear action, which is performed after each unit test case ends.
      // The int of execution times is the same as the int of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_STATIC_0100
     * @tc.number SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_STATIC_0100
     * @tc.desc   TTest_createPixelMap_decodingOptions_aihdr_auto_jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFd("test.jpg");
      try{
        await getTestResult('SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_STATIC_0100', image.DecodingDynamicRange.HDR);
        expect(result).assertTrue();
        done();
      } catch (e) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_DECODEOPTIONS_WITH_AIHDR_CREATEPIXELMAP_STATIC_0100 error:' + e);
        expect().assertFail();
        done();
      }
    });

  })
}
