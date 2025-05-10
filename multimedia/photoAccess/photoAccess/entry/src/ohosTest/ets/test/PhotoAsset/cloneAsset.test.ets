/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import systemDateTime from '@ohos.systemDateTime';
import common from '@ohos.app.ability.common';
import {
  sleep,
  photoKeys,
  fetchOption,
  getFileAsset,
  getPermission,
  pushCreateAsset,
  createMovingPhoto
} from '../common'


export default function cloneAssetTest() {

  const context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let helper = photoAccessHelper.getPhotoAccessHelper(context);
  const fileNameList = ["cloneTest.jpg", "cloneTest.mp4"];

  describe('cloneAssetTest', () => {

    beforeAll(async () => {
      await getPermission();
      await sleep(10);
      await pushCreateAsset(context, fileNameList);
      await sleep(3500);
    })


    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_001
     * @tc.name      : test_clone_image_001
     * @tc.desc      : clone image, expect success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_image_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_image_001";
      let title: string = "";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context,testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        title = systemDateTime.getTime().toString();
        console.log(`${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(title + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_002
     * @tc.name      : test_clone_video_001
     * @tc.desc      : clone video, expect success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_video_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_video_001";
      let title: string = "";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.mp4");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.mp4 failed !`)
          expect(false).assertTrue();
          done();
        }
        title = systemDateTime.getTime().toString();
        console.log(`${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(title + ".mp4"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_003
     * @tc.name      : test_clone_moving_photo_001
     * @tc.desc      : clone moving photo, expect success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_moving_photo_001", 0, async (done: Function) => {
      let testNum = "test_clone_moving_photo_001";
      let cloneTitle: string = "";
      try {
        let title = "cloneMovingPhoto"
        let movingPhotoAsset = await createMovingPhoto(testNum, context, title);
        if (movingPhotoAsset === undefined) {
          console.error(`${testNum} :: create moving Photo failed !`);
          expect(false).assertTrue();
          done();
        }
        await sleep(3000);
        cloneTitle = systemDateTime.getTime().toString();
        console.log(`${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await movingPhotoAsset?.clone(cloneTitle);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(cloneTitle + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_004
     * @tc.name      : test_clone_long_title_001
     * @tc.desc      : clone image with titile and suffix length <= 255 , expect success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_long_title_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_long_title_001";
      let title: string = "1".repeat(251);
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        
        console.log(`${testNum} :: title len is ${title.length}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(title + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_005
     * @tc.name      : test_clone_long_title_002
     * @tc.desc      : clone image with titile and suffix length > 255 , expect failed and errCode is 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_long_title_002", 0, async (done: Function) => {
      let testNum: string = "test_clone_long_title_002";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "1".repeat(252);
        console.log(`${testNum} :: title lenght is ${title.length}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        console.log(`${testNum} :: clone success, expect failed !`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual("401");
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_006
     * @tc.name      : test_clone_with_suffix_001
     * @tc.desc      : clone image, titile with suffix, expect failed and errCode is 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_with_suffix_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_with_suffix_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "xyz.jpg";
        console.log(`${testNum} :: title lenght is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        console.log(`${testNum} :: clone success, expect failed !`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual("401");
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_007
     * @tc.name      : test_clone_with_illegal_str_001
     * @tc.desc      : clone image, titile with illegal str, expect failed and errCode is 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_with_illegal_str_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_with_illegal_str_001";
      try {
        let count = 0;
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
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
            console.log(`${testNum} :: illegal titile , errCode is ${error.code}`);
            expect(error.code).assertEqual("401");
            count++;
          }
        }
        console.log(`${testNum} :: sumCount = ${count}, illegalStrList len = ${illegalStrList.length}`);
        expect(count).assertEqual(illegalStrList.length);
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_008
     * @tc.name      : test_clone_with_empty_str_001
     * @tc.desc      : clone image, titile is empty str, expect failed and errCode is 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("test_clone_with_empty_str_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_with_empty_str_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(context, testNum, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "";
        console.log(`${testNum} :: title lenght is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        console.log(`${testNum} :: clone success, expect failed !`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual("401");
        done();
      }
    })

  });
}