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


export default function photoPickerCallback(abilityContexts: Context) {
  describe("photoPickerCallback", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await stopAbility('com.huawei.hmos.photos');
      await stopAbility('com.ohos.photos');
      await sleep(500);
    });

    /**
     * @tc.name   test_Photopicker_Select_Callback_000
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0000
     * @tc.desc   select image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_000";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Select_Callback_001
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0100
     * @tc.desc   select video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_001";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.VIDEO_TYPE;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Select_Callback_002
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0200
     * @tc.desc   select image&video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_002", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_002";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Select_Callback_003
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0300
     * @tc.desc   select image&video, singleSelect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_003", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_003";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 1;
      let expectSelectNum = 1;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Select_Callback_004
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0400
     * @tc.desc   select image&video, multipleselect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_004", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_004";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 2;
      let expectSelectNum = 2;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Select_Callback_005
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0500
     * @tc.desc   select image&video, default selectNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_005", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_005";
      let option = new picker.PhotoSelectOptions();
      option.MIMEType = picker.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
      option.maxSelectNumber = 0;
      let expectSelectNum = 2;
      await selectWithOption(testNum, done, option, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Select_Callback_006
     * @tc.number SUB_STORAGE_PHOTOPICKER_SELECT_CALLBACK_0600
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Select_Callback_006", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Select_Callback_006";
      let expectSelectNum = 2;
      let isSelectOriginal = true;
      await select(testNum, done, isSelectOriginal, expectSelectNum);
    });
    /**
     * @tc.name   test_Photopicker_Save_Callback_000
     * @tc.number SUB_STORAGE_PHOTOPICKER_SAVE_CALLBACK_0000
     * @tc.desc   save jpg in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Save_Callback_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Save_Callback_000";
      let option = new picker.PhotoSaveOptions();
      option.newFileNames = ["PhotoViewPicker01.jpg"];
      let saveDir = "Pictures";
      await saveWithOption(testNum, done, option, saveDir);
    });
    /**
     * @tc.name   test_Photopicker_Save_Callback_001
     * @tc.number SUB_STORAGE_PHOTOPICKER_SAVE_CALLBACK_0100
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Save_Callback_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Save_Callback_001";
      let option = new picker.PhotoSaveOptions();
      option.newFileNames = ["PhotoViewPicker01.mp4"];
      let saveDir = "Videos";
      await saveWithOption(testNum, done, option, saveDir);
    });
    /**
     * @tc.name   test_Photopicker_Save_Callback_002
     * @tc.number SUB_STORAGE_PHOTOPICKER_SAVE_CALLBACK_0200
     * @tc.desc   save without option, cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Photopicker_Save_Callback_002", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Photopicker_Save_Callback_002";
      await saveWithoutSelect(testNum, done);
    });
  });
}

async function select(testNum: string, done: Function, isSelectOriginal: boolean, expectSelectNum = 2) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.select((err, result) => {
      if (err != undefined) {
        console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;
      }
      console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
      done();
    });
    expect(true).assertTrue();
    done();
  }
  catch (error) {
    console.info(`${testNum}::select error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function selectWithOption(testNum: string, done: Function, option: picker.PhotoSelectOptions, expectSelectNum: number) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.select(option, (err, result) => {
      if (err != undefined) {
        console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
        return;

      }
      console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
      done();
    });
    expect(true).assertTrue();
    done();
  }
  catch (error) {
    console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithoutSelect(testNum: string, done: Function) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.save((err, result) => {
      if (err != undefined) {
        console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
        done();
        return;
      }
      console.info(`${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
      done();
    });
    expect(true).assertTrue();
    done();
  }
  catch (error) {
    console.info(`${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithOption(testNum: string, done: Function, option: picker.PhotoSaveOptions, dirName: string) {
  try {
    let photoPicker = new picker.PhotoViewPicker();
    photoPicker.save(option, (err, result) => {
      if (err != undefined) {
        console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
        done();
        return;
      }
      console.info(`${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
      done();
    });
    expect(true).assertTrue();
    done();
  }
  catch (error) {
    console.info(`${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}
