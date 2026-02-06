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

const TAG =  'setMetadataSupp';

async function setMetadataAbnormalPromiseTest(done: Function, testName: string, path: string,
  metadataType: image.MetadataType,exifMetaData:image.Metadata,callback: (err: number) => void)  {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let pictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    if (pictureObj != null) {
      pictureObj.setMetadata(metadataType, exifMetaData).then(() => {
        console.info(TAG, 'Set metadata success');
        expect(exifMetaData != null).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG, 'Failed to set metadata. error.code: ' + JSON.stringify(error.code) + ' ,error.message:' +
        JSON.stringify(error.message));
        expect().assertFail();
      });
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    callback(error.code);
    done();
  }
}

export default function PictureSetMetadataTest() {
  describe('PictureSetMetadataTest', () => {

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
     * @tc.number     picture_setMetadata_promise_0001
     * @tc.name       picture_setMetadata_promise_0001
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0001';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = '' as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0002
     * @tc.name       picture_setMetadata_promise_0002
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0002';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = '' as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0003
     * @tc.name       picture_setMetadata_promise_0003
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0003';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = '' as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0004
     * @tc.name       picture_setMetadata_promise_0004
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0004';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = null as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0005
     * @tc.name       picture_setMetadata_promise_0005
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0005';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = null as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0006
     * @tc.name       picture_setMetadata_promise_0006
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0006';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = null as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0007
     * @tc.name       picture_setMetadata_promise_0007
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0007';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = undefined as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0008
     * @tc.name       picture_setMetadata_promise_0008
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0008';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = undefined as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

    /**
     * @tc.number     picture_setMetadata_promise_0009
     * @tc.name       picture_setMetadata_promise_0009
     * @tc.desc       setMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('picture_setMetadata_promise_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_setMetadata_promise_0009';
      const path = 'test.jpg';
      let exifMetaData: image.Metadata = undefined as ESObject;
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType,exifMetaData,(errCode) => {
        expect(errCode == 9001005).assertTrue();
      });
    })

  })
}