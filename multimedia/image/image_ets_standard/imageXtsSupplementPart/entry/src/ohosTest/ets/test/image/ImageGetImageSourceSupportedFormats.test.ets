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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'Image.GetImageSourceSupportedFormatsSupp'
let fdNumber: number;
async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG,'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG,"image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG,"image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG,"image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
export default function GetImageSourceSupportedFormats() {
  describe('GetImageSourceSupportedFormats', ()=>{
    beforeAll(async ()=>{
      console.info('beforeAll case');
    });
    beforeEach(async ()=>{
      console.info('beforeEach case');
    });
    afterEach(async ()=>{
      console.info('afterEach case');
    });
    afterAll(()=>{
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_001
     * @tc.number SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_001
     * @tc.desc   image.getImageSourceSupportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_001', Level.LEVEL1, async (done:Function)=> {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_001';
      try {
        let formats : string[] = image.getImageSourceSupportedFormats();
        console.info(TAG,'image.getImageSourceSupportedFormats success:', formats);
        expect(formats.length > 0).assertTrue();
      } catch (err) {
        expect().assertFail();
        console.info(TAG,`failed; error: ${err}`, err.code, testName);
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_002
     * @tc.number SUB_MEDIA_IMAGE_GET_IMAGE_PACKER_SUPPORTED_FORMATS_002
     * @tc.desc   image.getImagePackerSupportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_002', Level.LEVEL1, async (done:Function)=> {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_SOURCE_SUPPORTED_FORMATS_002';
      try {
        let formats : string[] = image.getImagePackerSupportedFormats();
        console.info(TAG,'image.getImageSourceSupportedFormats success:', formats);
        expect(formats.length > 0).assertTrue();
      } catch (err) {
        expect().assertFail();
        console.info(TAG,`failed; error: ${err}`, err.code, testName);
      }
      done();
    })
  });
}