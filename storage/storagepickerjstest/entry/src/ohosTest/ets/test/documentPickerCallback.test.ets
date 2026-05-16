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

export default function documentPickerCallback(abilityContext: Context) {
  describe("documentPickerCallback", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await stopAbility('com.ohos.filepicker');
      await sleep(500);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_000
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0000
     * @tc.desc   select with option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_000", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_000";
      let option = new picker.DocumentSelectOptions();
      await selectWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0100
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_001";
      await select(testNum, done);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0200
     * @tc.desc   select with option maxSelectNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_002", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_002";
      let option = new picker.DocumentSelectOptions();
      option.maxSelectNumber = 3;
      await selectWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0300
     * @tc.desc   select with option defaultFilePathUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_003", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_003";
      let option = new picker.DocumentSelectOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
      await selectWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0400
     * @tc.desc   select with option image fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_004";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.png', '.jpg'];
      await selectWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0500
     * @tc.desc   select with option docs fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_005";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.pptx', '.docx', '.xlsx', '.txt'];
      await selectWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0600
     * @tc.desc   select with option video fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_006";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.mp4'];
      await selectWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_007
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0700
     * @tc.desc   select with option audio fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_007", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_007";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.mp3'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_008
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0800
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_008", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_008";
      let option = new picker.DocumentSelectOptions();
      option.multiAuthMode = true;
      option.multiUriArray = [];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_009
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0900
     * @tc.desc   select with option MergeTypeMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_009", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_009";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.DEFAULT;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_010
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1000
     * @tc.desc   select with option MergeTypeMode.AUDIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_010", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_010";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.AUDIO;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_011
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1100
     * @tc.desc   select with option MergeTypeMode.VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_011", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_011";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.VIDEO;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_012
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1200
     * @tc.desc   select with option MergeTypeMode.DOCUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_012", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_012";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.DOCUMENT;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_013
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1300
     * @tc.desc   select with option MergeTypeMode.PICTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_013", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_013";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.PICTURE;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_014
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1400
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_014", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_014";
      let option = new picker.DocumentSelectOptions();
      option.isEncryptionSupported = true;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_015
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1500
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_015", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Callback_015";
      let option = new picker.DocumentSelectOptions();
      option.isEncryptionSupported = false;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Callback_000
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0000
     * @tc.desc   save image in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Documentpicker_Save_Callback_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_000";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.jpg"];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0100
     * @tc.desc   save file in Documents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_001";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.dat"];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0200
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Callback_002", Level.LEVEL3, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_002";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.mp4"];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0300
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Callback_003", Level.LEVEL3, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_003";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.mp3"];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0400
     * @tc.desc   save without option, cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Callback_004", Level.LEVEL3, async (done: Function) => {
      let testNum = "documentpicker_save_callback_004";
      await saveWithoutSelect(testNum, done);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0500
     * @tc.desc   save png in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_005";
      let option = new picker.DocumentSaveOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1/202308171505.png";
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0600
     * @tc.desc   save suffix in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_006";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.png', '.jpg'];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_007
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0700
     * @tc.desc   save suffix in Documents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_007", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_007";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.pptx', '.docx', '.xlsx', '.txt'];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_008
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0800
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_008", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_008";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.mp4'];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_009
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0900
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_009", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_009";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.mp3'];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_010
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_1000
     * @tc.desc   save option=DOWNLOAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_010", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_010";
      let option = new picker.DocumentSaveOptions();
      option.pickerMode = picker.DocumentPickerMode.DOWNLOAD;
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_011
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_1100
     * @tc.desc   save option=DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_011", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Callback_011";
      let option = new picker.DocumentSaveOptions();
      option.pickerMode = picker.DocumentPickerMode.DEFAULT;
      await saveWithOption(testNum, done, option);
    });
  });
}

async function select(testNum: string, done: Function) {
  try {
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.select((err, result) => {
      if (err != undefined) {
        console.info(`${testNum}::select fail, err: ${JSON.stringify(err)}`);
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

async function selectWithOption(testNum: string, done: Function, option: picker.DocumentSelectOptions) {
  try {
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.select(option, (err, result) => {
      if (err != undefined) {
        console.info(`${testNum}::selectWithOption fail, err: ${JSON.stringify(err)}`);
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
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.save((err, result) => {
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

async function saveWithOption(testNum: string, done: Function, option: picker.DocumentSaveOptions) {
  try {
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.save(option, (err, result) => {
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
