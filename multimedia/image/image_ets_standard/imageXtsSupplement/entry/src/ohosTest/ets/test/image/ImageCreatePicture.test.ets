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
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'ImageCreatePictureTestSupp';


async function createPictureAbnormalPromiseTest(done: Function, testName: string, path: string,callback:(err:number)=>void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    console.info(TAG,testName,'resourceMgr')
    const rawFile = await resourceMgr.getRawFileContent(path);
    console.info(TAG,testName,'rawFile')
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    console.info(TAG,testName,'imageSource')
    let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    console.info(TAG,testName,'commodityPixelMap')
    let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
    done();
  } catch (error) {
    console.info(TAG, testName,`failed; error: `,JSON.stringify(error),error.code);
    callback(error.code);
    done();
  }
}

export default function ImageCreatePictureTest() {
  describe('ImageCreatePictureTest', () => {
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
     * @tc.name   IMAGE_CREATE_PICTURE_001
     * @tc.number IMAGE_CREATE_PICTURE_001
     * @tc.desc   IMAGE_CREATE_PICTURE_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PICTURE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PICTURE_001';
      await createPictureAbnormalPromiseTest(done, testName, undefined as ESObject, (errorCode: number) => {
        expect(errorCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   IMAGE_CREATE_PICTURE_002
     * @tc.number IMAGE_CREATE_PICTURE_002
     * @tc.desc   测试第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PICTURE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PICTURE_002';
      await createPictureAbnormalPromiseTest(done, testName, null as ESObject, (errorCode: number) =>{
        expect(errorCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   IMAGE_CREATE_PICTURE_003
     * @tc.number IMAGE_CREATE_PICTURE_003
     * @tc.desc   测试第一个参数为空值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PICTURE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PICTURE_003';
      const pixelmapParam = '';
      await createPictureAbnormalPromiseTest(done, testName, '',(errorCode: number) => {
        expect(errorCode).assertEqual(9001005);
      });
    })
  })
}