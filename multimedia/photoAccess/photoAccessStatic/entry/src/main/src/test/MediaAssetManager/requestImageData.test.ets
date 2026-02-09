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

import Context from "application.Context"
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from '../../../../hypium/index'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import hilog from '@ohos.hilog'
import { fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets';
import { BusinessError } from '@ohos.base'

let domain: int= 0x0000;
let tag: string = 'testTag';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer | undefined, map?: Map<string, string>) {
    hilog.info(domain, tag, `MediaHandler succeed`);
  }
}

export default function requestImageDataTest() {
  describe('requestImageDataTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   request_image_data_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0100
     * @tc.desc   request image data with fastMode and oringinalMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'request_image_data_static_001';
        try {
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          }
          const handler = new MediaHandler;
          photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
          done()
        } catch (error) {
          hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });
  });
}