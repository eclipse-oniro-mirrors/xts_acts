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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getAllProperties';

async function getAllPropertiesPromiseTest(done: Function, testName: string, path: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
    let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
    let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
    if (metaData != null) {
      let data = await metaData.getAllProperties();
      const count = Object.keys(data).length;
      expect(count > 0).assertTrue();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function getAllPropertiesTest() {
  describe('getAllPropertiesTest', () => {

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
     * @tc.name   getAllProperties_promise_001
     * @tc.number METADATA_GET_ALL_PROPERTIES_001
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllProperties_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAllProperties_promise_001';
      const path = 'CUVAHdr.jpg';
      await getAllPropertiesPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   getAllProperties_promise_002
     * @tc.number METADATA_GET_ALL_PROPERTIES_002
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllProperties_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAllProperties_promise_002';
      const path = 'CUVAHdrMulti.jpg';
      await getAllPropertiesPromiseTest(done, testName, path);
    })

    /**
     * @tc.name   getAllProperties_promise_003
     * @tc.number METADATA_GET_ALL_PROPERTIES_003
     * @tc.desc   getAllProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllProperties_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getAllProperties_promise_003';
      const path = 'test_exif.jpg';
      await getAllPropertiesPromiseTest(done, testName, path);
    })
  })
}