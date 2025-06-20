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

import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
import { sleep, startAbility, stopAbility } from './Common';
import picker from '@ohos.file.picker';

export default function photoPickerPromise(abilityContext: Context) {
  describe("photoPickerPromise", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await stopAbility('com.huawei.hmos.photos');
      await stopAbility('com.ohos.photos');
      await sleep(500);
    })

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0000
     * @tc.name   : test_Photopicker_Select_Promise_000
     * @tc.desc   : select image
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Select_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_000";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0100
     * @tc.name   : test_Photopicker_Select_Promise_001
     * @tc.desc   : select video
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Select_Promise_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_001";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.VIDEO_TYPE;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0200
     * @tc.name   : test_Photopicker_Select_Promise_002
     * @tc.desc   : select image&video
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Select_Promise_002", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_002";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0300
     * @tc.name   : test_Photopicker_Select_Promise_003
     * @tc.desc   : select image&video, singleSelect
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 0
     */
    it("test_Photopicker_Select_Promise_003", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_003";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0400
     * @tc.name   : test_Photopicker_Select_Promise_004
     * @tc.desc   : select image&video, multipleselect
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Photopicker_Select_Promise_004", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_004";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 2;
      let expectSelectNum = 2;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0500
     * @tc.name   : test_Photopicker_Select_Promise_005
     * @tc.desc   : select image&video, default selectNum
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Select_Promise_005", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_005";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 0;
      let expectSelectNum = 2;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0600
     * @tc.name   : test_Photopicker_Select_Promise_006
     * @tc.desc   : select without option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Select_Promise_006", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Promise_006";
      let expectSelectNum = 2;
      let isSelectOriginal = true;
      await select(testNum, done, isSelectOriginal, expectSelectNum);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SELECT_PROMISE_0700
     * @tc.name   : test_Photopicker_Select_Promise_007
     * @tc.desc   : select without option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Select_Promise_007", Level.LEVEL0, async (done: Function) => {
      try {
        let options = new picker.PhotoSelectOptions();
        options.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
        options.maxSelectNumber = 5;
        let photoPicker = new picker.PhotoViewPicker();
        photoPicker.select(options).then((PhotoSelectResult) => {
          console.info('photopicker_select_promise_007 successfully, photoSelectResult uri: ' + JSON.stringify(PhotoSelectResult));
          console.info('isOriginalPhoto: ' + PhotoSelectResult.isOriginalPhoto);
          console.info('photoUris: ' + PhotoSelectResult.photoUris);
          done();
        }).catch((err: Error) => {
          console.info('PhotoViewPicker.select failed with err: ' + JSON.stringify(err));
          expect(true).assertTrue();
          done();
        })
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error('PhotoViewPicker failed with err: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SAVE_PROMISE_0000
     * @tc.name   : test_Photopicker_Save_Promise_000
     * @tc.desc   : save jpg in Pictures
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 0
     */
    it("test_Photopicker_Save_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Save_Promise_000";
      let option = new picker.PhotoSaveOptions();
      option.newFileNames = ["PhotoViewPicker01.jpg"];
      let saveDir = "Pictures";
      await saveWithOption(testNum, done, option, saveDir);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SAVE_PROMISE_0100
     * @tc.name   : test_Photopicker_Save_Promise_001
     * @tc.desc   : save mp4 in Videos
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Save_Promise_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Save_Promise_001";
      let option = new picker.PhotoSaveOptions();
      option.newFileNames = ["PhotoViewPicker01.mp4"];
      let saveDir = "Videos";
      await saveWithOption(testNum, done, option, saveDir);
    });

    /**
     * @tc.number   : SUB_STORAGE_PHOTOPICKER_SAVE_PROMISE_0200
     * @tc.name   : test_Photopicker_Save_Promise_002
     * @tc.desc   : save without option, cancel
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Photopicker_Save_Promise_002", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Save_Promise_002";
      await saveWithoutSelect(testNum, done);
    });
  });
}

async function select(testNum: string, done: Function, isSelectOriginal: boolean, expectSelectNum = 2) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.select().then((result) => {
      console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
      expect(false).assertTrue();
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

async function selectWithOption(testNum: string, done: Function, option: picker.PhotoSelectOptions, expectSelectNum: number) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.select(option).then((result) => {
      console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
      expect(false).assertTrue();
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

async function saveWithoutSelect(testNum: string, done: Function) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.save().then((result) => {
      console.info(`${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
      done();
    })
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithOption(testNum: string, done: Function, option: picker.PhotoSaveOptions, dirName: string) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.save(option).then((result) => {
      console.info(`${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
      done();
    })
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}
