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

import { describe, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import { driveFn, getPermission, sleep, startAbility, stopAbility } from "../common"
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import { BusinessError } from '@ohos.base';

class RedColors implements CustomColors {
  fontPrimary = '#fff32b3c';
  fontEmphasize = '#FFD53032';
  fontOnPrimary = '#FFFFFFFF';
  compBackgroundTertiary = '#44FF2222';
  backgroundEmphasize = '#FFD00000';
  compEmphasizeSecondary = '#33FF1111';
  compBackgroundEmphasize = '#FFD00000';
}

export default function photoPickerTest() {
  describe("photoPickerTest", () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    afterEach(async () => {
      await sleep(1000);
      await startAbility('ohos.acts.multimedia.photoaccess', 'com.example.myapplication.MainAbility');
      await sleep(1000);
      await stopAbility('com.huawei.hmos.photos');
      await stopAbility('com.ohos.photos');
      await sleep(1000);
    })

    let selectPromise = async (testNum: string, done: Function, isSelectOriginal: boolean, expectSelectNum: number) => {
      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select().then((result: photoAccessHelper.PhotoSelectResult) => {
          console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
          console.info(`${testNum}::expectSelectNum: ${expectSelectNum}, actual: ${result.photoUris.length}`);
          console.info(`${testNum}::expectIsSelectOriginal: ${isSelectOriginal}, actual: ${result.isOriginalPhoto}`);
          expect(isSelectOriginal).assertEqual(result.isOriginalPhoto)
          done();
        }).catch((err: BusinessError) => {
          console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
          done();
        })
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum}::select error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    }

    let selectCallback = async (testNum: string, done: Function, isSelectOriginal: boolean, expectSelectNum: number) => {
      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select((err, result) => {
          if (err != undefined) {
            console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
            done();
            return;
          }
          console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
          console.info(`${testNum}::expectSelectNum: ${expectSelectNum}, actual: ${result.photoUris.length}`);
          console.info(`${testNum}::expectIsSelectOriginal: ${isSelectOriginal}, actual: ${result.isOriginalPhoto}`);
          done();
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum}::select error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    }

    let selectWithOptionPromise = async (testNum: string, done: Function, option:photoAccessHelper.PhotoSelectOptions, expectSelectNum: number)=> {
      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(option).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          console.info(`${testNum}::expectSelectNum: ${expectSelectNum}, actual: ${result.photoUris.length}`);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
          done();
        })
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    }

    let selectWithOptionCallback = async (testNum: string, done: Function, option:photoAccessHelper.PhotoSelectOptions, expectSelectNum: number)=> {
      try {
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoPicker.select(option, (err, result) => {
          if (err != undefined) {
            console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
            done();
            return;
          }
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          console.info(`${testNum}::expectSelectNum: ${expectSelectNum}, actual: ${result.photoUris.length}`);
          done();
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    }

    //promise
    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0000
     * @tc.name      : photopicker_select_promise_000
     * @tc.desc      : select with option.MIMEType = IMAGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_000", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_000";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0100
     * @tc.name      : photopicker_select_promise_001
     * @tc.desc      : select with option.MIMEType = VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_001", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_001";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0200
     * @tc.name      : photopicker_select_promise_002
     * @tc.desc      : select with option.MIMEType = IMAGE_VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_002", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_002";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0300
     * @tc.name      : photopicker_select_promise_003
     * @tc.desc      : select without option
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_003", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_003";
      let expectSelectNum = 1;
      let isSelectOriginal = false;
      await selectPromise(testNum, done, isSelectOriginal, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0400
     * @tc.name      : photopicker_select_promise_004
     * @tc.desc      : select with option isSearchSupported = true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_004", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_004";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      option.isSearchSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0500
     * @tc.name      : photopicker_select_promise_005
     * @tc.desc      : select with option isPhotoTakingSupported = true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_005", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_005";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      option.isPhotoTakingSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0600
     * @tc.name      : photopicker_select_promise_006
     * @tc.desc      : select with option isEditSupported = true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_006", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_006";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      option.isEditSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0700
     * @tc.name      : photopicker_select_promise_007
     * @tc.desc      : select with option preselectedUris
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_007", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_007";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      option.preselectedUris = undefined;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0800
     * @tc.name      : photopicker_select_promise_008
     * @tc.desc      : select with option themeColor
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_008", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_008";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.themeColor = new RedColors();
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_0900
     * @tc.name      : photopicker_select_promise_009
     * @tc.desc      : select with option MOVING_PHOTO_IMAGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_009", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_009";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.MOVING_PHOTO_IMAGE_TYPE;
      option.maxSelectNumber = 1;
      option.isPreviewForSingleSelectionSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_1000
     * @tc.name      : photopicker_select_promise_010
     * @tc.desc      : select with option isPreviewForSingleSelectionSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_010", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_010";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      option.isPreviewForSingleSelectionSupported = false;
      option.isOriginalSupported = false;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_1100
     * @tc.name      : photopicker_select_promise_011
     * @tc.desc      : select with option isOriginalSupported
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_011", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_011";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      option.isOriginalSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_PROMISE_1200
     * @tc.name      : photopicker_select_promise_012
     * @tc.desc      : select with option subWindowName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_promise_012", 0, async (done: Function) => {
      let testNum = "photopicker_select_promise_012";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      option.subWindowName = 'test';
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    //callback
    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0000
     * @tc.name      : photopicker_select_callback_000
     * @tc.desc      : select with option.MIMEType = IMAGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_000", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_000";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0100
     * @tc.name      : photopicker_select_callback_001
     * @tc.desc      : select with option.MIMEType = VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_001", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_001";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0200
     * @tc.name      : photopicker_select_callback_002
     * @tc.desc      : select with option.MIMEType = IMAGE_VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_002", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_002";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0300
     * @tc.name      : photopicker_select_callback_003
     * @tc.desc      : select without option
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_003", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_003";
      let expectSelectNum = 1;
      let isSelectOriginal = false;
      await selectCallback(testNum, done, isSelectOriginal, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0400
     * @tc.name      : photopicker_select_callback_004
     * @tc.desc      : select with option isSearchSupported = true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_004", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_004";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      option.isSearchSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0500
     * @tc.name      : photopicker_select_callback_005
     * @tc.desc      : select with option isPhotoTakingSupported = true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_005", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_005";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      option.isPhotoTakingSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_PHOTOPICKER_SELECT_CALLBACK_0600
     * @tc.name      : photopicker_select_callback_006
     * @tc.desc      : select with option isEditSupported = true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("photopicker_select_callback_006", 0, async (done: Function) => {
      let testNum = "photopicker_select_callback_006";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      option.isEditSupported = true;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    //promise
    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0000
     * @tc.name      : smart_photopicker_select_promise_000
     * @tc.desc      : select with option.MIMEType = IMAGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("smart_photopicker_select_promise_000", 0, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_000";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0100
     * @tc.name      : smart_photopicker_select_promise_001
     * @tc.desc      : select with option.MIMEType = VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("smart_photopicker_select_promise_001", 0, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_001";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0200
     * @tc.name      : smart_photopicker_select_promise_002
     * @tc.desc      : select with option.MIMEType = IMAGE_VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("smart_photopicker_select_promise_002", 0, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_002";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0300
     * @tc.name      : smart_photopicker_select_promise_003
     * @tc.desc      : select with recommendationType = QR_OR_BAR_CODE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_003", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_003";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_OR_BAR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0400
     * @tc.name      : smart_photopicker_select_promise_004
     * @tc.desc      : select with recommendationType = BAR_CODE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_004", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_004";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.BAR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0500
     * @tc.name      : smart_photopicker_select_promise_005
     * @tc.desc      : select with recommendationType = ID_CARD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_005", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_005";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.ID_CARD;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0600
     * @tc.name      : smart_photopicker_select_promise_006
     * @tc.desc      : select with recommendationType = PROFILE_PICTURE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_006", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_006";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.PROFILE_PICTURE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0700
     * @tc.name      : smart_photopicker_select_promise_007
     * @tc.desc      : select with recommendationType = PASSPORT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_007", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_007";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.PASSPORT;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0800
     * @tc.name      : smart_photopicker_select_promise_008
     * @tc.desc      : select with recommendationType = BANK_CARD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_008", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_008";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.BANK_CARD;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_0900
     * @tc.name      : smart_photopicker_select_promise_009
     * @tc.desc      : select with recommendationType = DRIVER_LICENSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_009", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_009";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.DRIVER_LICENSE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_1000
     * @tc.name      : smart_photopicker_select_promise_010
     * @tc.desc      : select with recommendationType = DRIVING_LICENSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_010", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_010";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.DRIVING_LICENSE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_1100
     * @tc.name      : smart_photopicker_select_promise_011
     * @tc.desc      : select with recommendationType = PROFILE_PICTURE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_011", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_011";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      let textContextInfo: photoAccessHelper.TextContextInfo = {
        text: '上海野生动物园的大熊猫'
      }
      recommendationOptions.textContextInfo = textContextInfo;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_PROMISE_1200
     * @tc.name      : smart_photopicker_select_promise_012
     * @tc.desc      : select with recommendationType = FEATURED_SINGLE_PORTRAIT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_promise_012", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_promise_012";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.FEATURED_SINGLE_PORTRAIT;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionPromise(testNum, done, option, expectSelectNum);
    });

    //callback
    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0000
     * @tc.name      : smart_photopicker_select_callback_000
     * @tc.desc      : select with option.MIMEType = IMAGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("smart_photopicker_select_callback_000", 0, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_000";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0100
     * @tc.name      : smart_photopicker_select_callback_001
     * @tc.desc      : select with option.MIMEType = VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("smart_photopicker_select_callback_001", 0, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_001";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0200
     * @tc.name      : smart_photopicker_select_callback_002
     * @tc.desc      : select with option.MIMEType = IMAGE_VIDEO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("smart_photopicker_select_callback_002", 0, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_002";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0300
     * @tc.name      : smart_photopicker_select_callback_003
     * @tc.desc      : select with recommendationType = QR_OR_BAR_CODE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_003", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_003";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.QR_OR_BAR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0400
     * @tc.name      : smart_photopicker_select_callback_004
     * @tc.desc      : select with recommendationType = BAR_CODE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_004", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_004";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.BAR_CODE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0500
     * @tc.name      : smart_photopicker_select_callback_005
     * @tc.desc      : select with recommendationType = ID_CARD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_005", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_005";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.ID_CARD;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0600
     * @tc.name      : smart_photopicker_select_callback_006
     * @tc.desc      : select with recommendationType = PROFILE_PICTURE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_006", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_006";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.PROFILE_PICTURE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0700
     * @tc.name      : smart_photopicker_select_callback_007
     * @tc.desc      : select with recommendationType = PASSPORT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_007", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_007";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.PASSPORT;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0800
     * @tc.name      : smart_photopicker_select_callback_008
     * @tc.desc      : select with recommendationType = BANK_CARD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_008", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_008";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.BANK_CARD;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_0900
     * @tc.name      : smart_photopicker_select_callback_009
     * @tc.desc      : select with recommendationType = DRIVER_LICENSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_009", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_009";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.DRIVER_LICENSE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_1000
     * @tc.name      : smart_photopicker_select_callback_010
     * @tc.desc      : select with recommendationType = DRIVING_LICENSE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_010", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_010";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.DRIVING_LICENSE;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_1100
     * @tc.name      : smart_photopicker_select_callback_011
     * @tc.desc      : select with textContextInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_011", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_011";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      let textContextInfo: photoAccessHelper.TextContextInfo = {
        text: '上海野生动物园的大熊猫'
      }
      recommendationOptions.textContextInfo = textContextInfo;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_SMART_PHOTOPICKER_SELECT_CALLBACK_1200
     * @tc.name      : smart_photopicker_select_callback_012
     * @tc.desc      : select with recommendationType = FEATURED_SINGLE_PORTRAIT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("smart_photopicker_select_callback_012", 1, async (done: Function) => {
      let testNum = "smart_photopicker_select_callback_012";
      let option = new photoAccessHelper.PhotoSelectOptions();
      option.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let recommendationOptions: photoAccessHelper.RecommendationOptions =
        new photoAccessHelper.RecommendationOptions();
      recommendationOptions.recommendationType = photoAccessHelper.RecommendationType.FEATURED_SINGLE_PORTRAIT;
      option.recommendationOptions = recommendationOptions;
      let expectSelectNum = 1;
      await selectWithOptionCallback(testNum, done, option, expectSelectNum);
    });
  });
}
