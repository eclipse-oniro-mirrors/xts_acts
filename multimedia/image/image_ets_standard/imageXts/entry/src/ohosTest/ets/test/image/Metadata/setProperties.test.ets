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
import { ErrorCode } from '../../CommonErrorCode';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'setProperties';

async function setPropertiesPromiseTest(done: Function, testName: string, path: string,
  setkey?: Record<string, string | null>) {
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
      await metaData.setProperties(setkey);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function setPropertiesAbnormalPromiseTest(done: Function, testName: string, path: string,
  setkey?: ESObject) {
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
      await metaData.setProperties(setkey);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.Unsupported_Metadata || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function setPropertiesTest() {
  describe('setPropertiesTest', () => {

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
     * @tc.name   setProperties_promise_001
     * @tc.number METADATA_SET_PROPERTIES_001
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_001';
      const path = 'CUVAHdr.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "300",
        "ImageLength": "300"
      };
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_promise_002
     * @tc.number METADATA_SET_PROPERTIES_002
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_002';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "1000",
        "ImageLength": "1000"
      };
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_promise_003
     * @tc.number METADATA_SET_PROPERTIES_003
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_003';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "0",
        "ImageLength": "1000"
      };
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_promise_004
     * @tc.number METADATA_SET_PROPERTIES_004
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_004';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "1000",
        "ImageLength": "0"
      };
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_promise_005
     * @tc.number METADATA_SET_PROPERTIES_005
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_005';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "0",
        "ImageLength": "0"
      };
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_promise_006
     * @tc.number METADATA_SET_PROPERTIES_006
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_006';
      const path = 'test_exif.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": "200",
        "ImageLength": "300"
      };
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_promise_007
     * @tc.number METADATA_SET_PROPERTIES_007
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_promise_007';
      const path = 'test_exif.jpg';
      let setkey: Record<string, string | null> = {};
      await setPropertiesPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_abnormal_promise_001
     * @tc.number METADATA_SET_PROPERTIES_008
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_abnormal_promise_001', Level.LEVEL0,
      async (done: Function) => {
        const testName = 'setProperties_abnormal_promise_001';
        const path = 'CUVAHdrMulti.jpg';
        let setkey: Record<string, string | null> = {
          "ImageWidth": '300',
          "ImageLength": null
        };
        await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
      })

    /**
     * @tc.name   setProperties_abnormal_promise_002
     * @tc.number METADATA_SET_PROPERTIES_009
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_abnormal_promise_002';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": null,
        "ImageLength": '600'
      };
      await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_abnormal_promise_003
     * @tc.number METADATA_SET_PROPERTIES_010
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_abnormal_promise_003';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": null,
        "ImageLength": null
      };
      await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_abnormal_promise_004
     * @tc.number METADATA_SET_PROPERTIES_011
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_abnormal_promise_004';
      const path = 'CUVAHdrMulti.jpg';
      let setkey: Record<string, string | null> = {
        "ImageWidth": null,
        "ImageLength": null
      };
      await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_abnormal_promise_005
     * @tc.number METADATA_SET_PROPERTIES_012
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_abnormal_promise_005';
      const path = 'CUVAHdrMulti.jpg';
      let setkey = null;
      await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
    })

    /**
     * @tc.name   setProperties_abnormal_promise_006
     * @tc.number METADATA_SET_PROPERTIES_013
     * @tc.desc   setProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setProperties_abnormal_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'setProperties_abnormal_promise_006';
      const path = 'CUVAHdrMulti.jpg';
      let setkey = undefined;
      await setPropertiesAbnormalPromiseTest(done, testName, path, setkey);
    })
  })
}