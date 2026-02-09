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

import { describe, beforeAll, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import { BusinessError } from '@ohos.base'
import systemDateTime from '@ohos.systemDateTime';
import {
  sleep,
  fetchOption,
  getFileAsset,
  getPermission,
  createMovingPhoto,
  pushCreateAsset
} from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function cloneAssetTest() {

  const context: Context = Hypium.get("context") as Context;
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
     * @tc.name   test_clone_image_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_001
     * @tc.desc   clone image, expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_image_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void):
      Promise<void> => {
      let testNum: string = "test_clone_image_static_001";
      let title: string = "";
      try {
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
        let timeNum: number = systemDateTime.getTime();
        title = String(timeNum);
        hilog.info(domain, tag, `${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;

        if (photoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        } else {
          newPhotoAsset = await photoAsset.clone(title);
        }

        if (newPhotoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (title + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_clone_video_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_002
     * @tc.desc   clone video, expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_video_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void):
      Promise<void> => {
      let testNum: string = "test_clone_video_static_001";
      let title: string = "";
      try {
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.mp4");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
        title = String(systemDateTime.getTime());
        hilog.info(domain, tag, `${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;
        if (photoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.mp4 failed !`)
          expect(false).assertTrue();
          done();
        } else {
          newPhotoAsset = await photoAsset.clone(title);
        }
        if (newPhotoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (title + ".mp4"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_clone_moving_photo_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_003
     * @tc.desc   clone moving photo, expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_moving_photo_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void):
        Promise<void> => {
        let testNum = "test_clone_moving_photo_static_001";
        let cloneTitle: string = "";
        try {
          let title = "cloneMovingPhoto"
          let movingPhotoAsset = await createMovingPhoto(testNum, context, title);
          if (movingPhotoAsset === undefined) {
            hilog.error(domain, tag, `${testNum} :: create moving Photo failed !`);
            expect(false).assertTrue();
            done();
          }
          await sleep(3000);
          cloneTitle = String(systemDateTime.getTime());
          hilog.info(domain, tag, `${testNum} :: title is ${title}`);
          let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;
          if (movingPhotoAsset !== undefined) {
            newPhotoAsset = await (movingPhotoAsset as photoAccessHelper.PhotoAsset).clone(cloneTitle);
          }
          if (newPhotoAsset === undefined) {
            hilog.error(domain, tag, `${testNum} :: clone failed !`)
            expect(false).assertTrue();
            done();
          }
          let fetchCloneOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (cloneTitle + ".jpg"));
          let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchCloneOps);
          if (cloneAsset === undefined) {
            hilog.error(domain, tag, `${testNum} :: after clone, then query, is undefined !`)
            expect(false).assertTrue();
            done();
          }
          done();
        } catch (error) {
          hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   test_clone_long_title_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_004
     * @tc.desc   clone image with titile and suffix length <= 255 , expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_long_title_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void):
      Promise<void> => {
      let testNum: string = "test_clone_long_title_static_001";
      let title: string = "1".repeat(251);
      hilog.info(domain, tag, `${testNum} :: title len is ${title.length}`);
      try {
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;
        if (photoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        } else {
          newPhotoAsset = await photoAsset.clone(title);
        }
        if (newPhotoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, (title + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchCloneOps);
        if (cloneAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_clone_long_title_static_002
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_005
     * @tc.desc   clone image with titile and suffix length > 255 , expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_long_title_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void):
      Promise<void> => {
      let testNum: string = "test_clone_long_title_static_002";
      try {
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
        if (photoAsset === undefined) {
          hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "1".repeat(252);
        hilog.info(domain, tag, `${testNum} :: title lenght is ${title.length}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;
        if (photoAsset) {
          newPhotoAsset = await photoAsset.clone(title);
          hilog.info(domain, tag, `${testNum} :: clone success, expect failed !`);
          expect(false).assertTrue();
          done();
        }
      } catch (error: BusinessError) {
        hilog.error(domain, tag, `${testNum} :: test failed ,errorCode is ${error.code}`);
        hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   test_clone_with_suffix_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_006
     * @tc.desc   clone image, titile with suffix, expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_with_suffix_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void):
        Promise<void> => {
        let testNum: string = "test_clone_with_suffix_static_001";
        try {
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.jpg");
          let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
          let title: string = "xyz.jpg";
          hilog.info(domain, tag, `${testNum} :: title lenght is ${title}`);
          let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;
          if (photoAsset === undefined) {
            hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.jpg failed !`)
            expect(false).assertTrue();
            done();
          } else {
            newPhotoAsset = await photoAsset.clone(title);
            hilog.info(domain, tag, `${testNum} :: clone success, expect failed !`);
            expect(false).assertTrue();
            done();
          }
        } catch (error: BusinessError) {
          hilog.error(domain, tag, `${testNum} :: test failed ,errorCode is ${error.code}`);
          hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   test_clone_with_illegal_str_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_007
     * @tc.desc   clone image, titile with illegal str, expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_with_illegal_str_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void):
        Promise<void> => {
        let testNum: string = "test_clone_with_illegal_str_static_001";
        try {
          let count = 0;
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.jpg");
          let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
          if (photoAsset === undefined) {
            hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.jpg failed !`)
            expect(false).assertTrue();
            done();
          }
          let illegalStrList: Array<string> = [
            ".", "\\", "/", ":", "*", "?", "\"", "'", "`", "<", ">", "|", "{", "}", "[", "]"
          ]
          for (let i = 0; i < illegalStrList.length; i++) {
            let title: string = "test001" + illegalStrList[i];
            if (photoAsset !== undefined) {
              try {
                await photoAsset.clone(title);
              } catch (error: BusinessError<void>) {
                hilog.info(domain, tag, `${testNum} :: illegal titile , errCode is ${error.code}`);
                expect(error.code).assertEqual(401);
                count++;
              }
            }
          }
          hilog.info(domain, tag, `${testNum} :: sumCount = ${count}, illegalStrList len = ${illegalStrList.length}`);
          expect(count).assertEqual(illegalStrList.length);
          done();
        } catch (error: BusinessError) {
          hilog.error(domain, tag, `${testNum} :: test failed ,errorCode is ${error.code}`);
          hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   test_clone_with_empty_str_static_001
     * @tc.number Sub_MediaLibrary_PhotoAccessHelper_Clone_Test_Static_008
     * @tc.desc   clone image, titile is empty str, expect failed and errCode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_clone_with_empty_str_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void):
        Promise<void> => {
        let testNum: string = "test_clone_with_empty_str_static_001";
        try {
          let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "cloneTest.jpg");
          let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, fetchOps);
          let title: string = "";
          hilog.info(domain, tag, `${testNum} :: title lenght is ${title}`);
          let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined;
          if (photoAsset === undefined) {
            hilog.error(domain, tag, `${testNum} :: getFileAsset cloneTest.jpg failed !`)
            expect(false).assertTrue();
            done();
          } else {
            newPhotoAsset = await photoAsset.clone(title);
            hilog.info(domain, tag, `${testNum} :: clone success, expect failed !`);
            expect(false).assertTrue();
            done();
          }
        } catch (error: BusinessError) {
          hilog.error(domain, tag, `${testNum} :: test failed ,errorCode is ${error.code}`);
          hilog.error(domain, tag, `${testNum} :: test failed ,error is ${error}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })
  });
}