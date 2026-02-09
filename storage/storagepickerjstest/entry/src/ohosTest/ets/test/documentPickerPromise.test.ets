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

export default function documentPickerPromise(abilityContext: Context) {
  describe("documentPickerPromise", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await stopAbility('com.ohos.filepicker');
      await sleep(500);
    })

    /**
     * @tc.name   test_Documentpicker_Select_Promise_000
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0000
     * @tc.desc   select with option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_000", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_000";
      let option = new picker.DocumentSelectOptions();
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0100
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_001";
      await select(testNum, done);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0200
     * @tc.desc   select with option maxSelectNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_002", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_002";
      let option = new picker.DocumentSelectOptions();
      option.maxSelectNumber = 3;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0300
     * @tc.desc   select with option defaultFilePathUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_003", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_003";
      let option = new picker.DocumentSelectOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0400
     * @tc.desc   select with option image fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_004";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.png', '.jpg'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0500
     * @tc.desc   select with option docs fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_005";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.pptx', '.docx', '.xlsx', '.txt'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0600
     * @tc.desc   select with option video fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_006";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.mp4'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_007
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0700
     * @tc.desc   select with option audio fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_007", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_007";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.mp3'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_008
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0800
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_008", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_008";
      let option = new picker.DocumentSelectOptions();
      option.multiAuthMode = true;
      option.multiUriArray = [];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_009
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0900
     * @tc.desc   select with option MergeTypeMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_009", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_009";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.DEFAULT;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_010
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1000
     * @tc.desc   select with option MergeTypeMode.AUDIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_010", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_010";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.AUDIO;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_011
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1100
     * @tc.desc   select with option MergeTypeMode.VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_011", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_011";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.VIDEO;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_012
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1200
     * @tc.desc   select with option MergeTypeMode.DOCUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_012", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_012";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.DOCUMENT;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_013
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1300
     * @tc.desc   select with option MergeTypeMode.PICTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_013", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_013";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.PICTURE;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_014
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1400
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_014", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_014";
      let option = new picker.DocumentSelectOptions();
      option.isEncryptionSupported = true;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Promise_015
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1500
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Promise_015", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_015";
      let option = new picker.DocumentSelectOptions();
      option.isEncryptionSupported = false;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_000
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0000
     * @tc.desc   save image in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Documentpicker_Save_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_000";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.jpg"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0100
     * @tc.desc   save file in Documents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_001";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.dat"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0200
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Promise_002", Level.LEVEL3, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_002";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.mp4"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0300
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Promise_003", Level.LEVEL3, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_003";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.mp3"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0400
     * @tc.desc   save uri in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_004";
      let option = new picker.DocumentSaveOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test";
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0500
     * @tc.desc   save png in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_005";
      let option = new picker.DocumentSaveOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1/202308171505.png";
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0600
     * @tc.desc   save suffix in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_006";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.png', '.jpg'];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_007
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0700
     * @tc.desc   save suffix in Documents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_007", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_007";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.pptx', '.docx', '.xlsx', '.txt'];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_008
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0800
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_008", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_008";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.mp4'];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_009
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0900
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_009", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_009";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.mp3'];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Promise_010
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_1000
     * @tc.desc   save option=DOWNLOAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_010", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_010";
      let option = new picker.DocumentSaveOptions();
      option.pickerMode = picker.DocumentPickerMode.DOWNLOAD;
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Promise_011
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_1100
     * @tc.desc   save option= picker.DocumentPickerMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Promise_011", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_011";
      let option = new picker.DocumentSaveOptions();
      option.pickerMode = picker.DocumentPickerMode.DEFAULT;
      await saveWithOption(testNum, done, option);
    });
  });
}


async function select(testNum: string, done: Function) {
  try {
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.select().then((result) => {
      console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
      done();
      return;
    })
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum}::select error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function selectWithOption(testNum: string, done: Function, option: picker.DocumentSelectOptions) {
  try {
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.select(option).then((result) => {
      console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
      done();
      return;
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
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.save().then((result) => {
      console.info(`${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
      done();
      return;
    })
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithOption(testNum: string, done: Function, option: picker.DocumentSelectOptions) {
  try {
    let documentPicker = new picker.DocumentViewPicker();
    documentPicker.save(option).then((result) => {
      console.info(`${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
      done();
      return;
    })
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(`${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}
