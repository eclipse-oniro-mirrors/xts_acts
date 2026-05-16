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

import { describe, beforeAll, it, expect, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import systemDateTime from '@ohos.systemDateTime';
import common from '@ohos.app.ability.common';
import { photoKeys, fetchOption, getFileAsset, getPermission, pushCreateAsset, driveFn, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getThumbnail';
const IMAGE_TEST_FILE = 'cloneTest.jpg';
const VIDEO_TEST_FILE = 'cloneTest.mp4';

export default function cloneAssetTest() {
  describe('cloneAssetTest', () => {
    const context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const fileNameList = [IMAGE_TEST_FILE, VIDEO_TEST_FILE];

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await pushCreateAsset(context, fileNameList);
    })

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
     * @tc.name   test_clone_image_001
     * @tc.number PHOTO_ASSET_CLONE_001
     * @tc.desc   clone image, expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_image_001", Level.LEVEL0, async (done: Function) => {
      let testName: string = "test_clone_image_001";
      try {
        let fetchOps = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
        let photoAsset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testName, fetchOps);
        const title = systemDateTime.getTime().toString();
        console.log(TAG, `${testName} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined) {
          console.error(TAG, `${testName} :: clone failed !`);
          expect().assertFail();
          done();
        }
        let fetchCloneOps = fetchOption(testName, photoKeys.DISPLAY_NAME, (title + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testName, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(TAG, `${testName} :: after clone, then query, is undefined !`);
          expect().assertFail();
        } else {
          console.info(TAG, `${testName} :: after clone, then query success.`);
        }
        done();
      } catch (error) {
        console.error(TAG, `${testName} :: test failed ,error is ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_clone_video_001
     * @tc.number PHOTO_ASSET_CLONE_002
     * @tc.desc   clone video, expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_video_001", Level.LEVEL0, async (done: Function) => {
      let testName: string = "test_clone_video_001";
      try {
        let fetchOps = fetchOption(testName, photoKeys.DISPLAY_NAME, VIDEO_TEST_FILE);
        let photoAsset: photoAccessHelper.PhotoAsset = await getFileAsset(context, testName, fetchOps);
        const title = systemDateTime.getTime().toString();
        console.log(TAG, `${testName} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined) {
          console.error(TAG, `${testName} :: clone failed !`);
          expect().assertFail();
          done();
        }

        let fetchCloneOps = fetchOption(testName, photoKeys.DISPLAY_NAME, (title + ".mp4"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testName, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(TAG, `${testName} :: after clone, then query, is undefined !`);
          expect().assertFail();
        } else {
          console.info(TAG, `${testName} :: after clone, then query success.`);
        }
        done();
      } catch (error) {
        console.error(TAG, `${testName} :: test failed ,error is ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_clone_long_title_002
     * @tc.number PHOTO_ASSET_CLONE_004
     * @tc.desc   clone image with titile and suffix length > 255 , expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_long_title_002", Level.LEVEL0, async (done: Function) => {
      let testName: string = "test_clone_long_title_002";
      try {
        let fetchOps = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testName, fetchOps);
        if (photoAsset === undefined) {
          console.error(TAG, `${testName} :: getFileAsset cloneTest.jpg failed !`);
          expect().assertFail();
          done();
        }
        let title: string = "B".repeat(252);
        console.log(TAG, `${testName} :: title lenght is ${title.length}`);
        await photoAsset?.clone(title);
        console.log(TAG, `${testName} :: clone success, expect failed !`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} :: test failed ,error is: ${error?.code}, ${error?.message}`);
        expect(error?.code).assertEqual("401");
        done();
      }
    })

    /**
     * @tc.name   test_clone_with_suffix_001
     * @tc.number PHOTO_ASSET_CLONE_005
     * @tc.desc   clone image, titile with suffix, expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_with_suffix_001", Level.LEVEL0, async (done: Function) => {
      let testName: string = "test_clone_with_suffix_001";
      try {
        let fetchOps = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testName, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testName} :: getFileAsset cloneTest.jpg failed !`);
          expect().assertFail();
          done();
        }
        let title: string = "xyz.jpg";
        console.log(`${testName} :: title lenght is ${title}`);
        await photoAsset?.clone(title);
        console.log(`${testName} :: clone success, expect failed !`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} :: test failed ,errorCode is ${error?.code}`);
        expect(error?.code).assertEqual("401");
        done();
      }
    })

    /**
     * @tc.name   test_clone_with_illegal_str_001
     * @tc.number PHOTO_ASSET_CLONE_006
     * @tc.desc   clone image, titile with illegal str, expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_with_illegal_str_001", Level.LEVEL0, async (done: Function) => {
      let testName: string = "test_clone_with_illegal_str_001";
      try {
        let count = 0;
        let fetchOps = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testName, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testName} :: getFileAsset cloneTest.jpg failed !`);
          expect().assertFail();
          done();
        }
        let illegalStrList: Array<string> = [
          ".", "\\", "/", ":", "*", "?", "\"", "'", "`", "<", ">", "|", "{", "}", "[", "]"
        ]
        for (let i = 0; i < illegalStrList.length; i++) {
          try {
            let title: string = "test001" + illegalStrList[i];
            photoAsset?.clone(title);
          } catch (error) {
            console.log(`${testName} :: illegal titile , errCode is ${error?.code}`);
            expect(error?.code).assertEqual("401");
            count++;
          }
        }
        console.log(`${testName} :: sumCount = ${count}, illegalStrList len = ${illegalStrList.length}`);
        expect(count).assertEqual(illegalStrList.length);
        done();
      } catch (error) {
        console.error(`${testName} :: test failed ,errorCode is ${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_clone_with_empty_str_001
     * @tc.number PHOTO_ASSET_CLONE_007
     * @tc.desc   clone image, titile is empty str, expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_with_empty_str_001", Level.LEVEL0, async (done: Function) => {
      let testName: string = "test_clone_with_empty_str_001";
      try {
        let fetchOps = fetchOption(testName, photoKeys.DISPLAY_NAME, IMAGE_TEST_FILE);
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testName, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testName} :: getFileAsset cloneTest.jpg failed !`);
          expect().assertFail();
          done();
        }
        let title: string = "";
        console.log(`${testName} :: title lenght is ${title}`);
        await photoAsset?.clone(title);
        console.log(`${testName} :: clone success, expect failed !`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} :: test failed ,errorCode is ${error?.code}`);
        expect(error?.code).assertEqual("401");
        done();
      }
    })

  });
}