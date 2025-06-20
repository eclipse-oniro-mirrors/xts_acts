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
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0000
     * @tc.name   : test_Documentpicker_Select_Promise_000
     * @tc.desc   : select with option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_000", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_000";
      let option = new picker.DocumentSelectOptions();
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0100
     * @tc.name   : test_Documentpicker_Select_Promise_001
     * @tc.desc   : select without option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_001";
      await select(testNum, done);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0200
     * @tc.name   : test_Documentpicker_Select_Promise_002
     * @tc.desc   : select with option maxSelectNumber
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_002", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_002";
      let option = new picker.DocumentSelectOptions();
      option.maxSelectNumber = 3;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0300
     * @tc.name   : test_Documentpicker_Select_Promise_003
     * @tc.desc   : select with option defaultFilePathUri
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_003", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_003";
      let option = new picker.DocumentSelectOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0400
     * @tc.name   : test_Documentpicker_Select_Promise_004
     * @tc.desc   : select with option image fileSuffixFilters
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_004";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.png', '.jpg'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0500
     * @tc.name   : test_Documentpicker_Select_Promise_005
     * @tc.desc   : select with option docs fileSuffixFilters
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_005";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.pptx', '.docx', '.xlsx', '.txt'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0600
     * @tc.name   : test_Documentpicker_Select_Promise_006
     * @tc.desc   : select with option video fileSuffixFilters
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_006";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.mp4'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0700
     * @tc.name   : test_Documentpicker_Select_Promise_007
     * @tc.desc   : select with option audio fileSuffixFilters
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_007", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_007";
      let option = new picker.DocumentSelectOptions();
      option.fileSuffixFilters = ['.mp3'];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0800
     * @tc.name   : test_Documentpicker_Select_Promise_008
     * @tc.desc   : select with option file parameter
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_008", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_008";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.FILE;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0900
     * @tc.name   : test_Documentpicker_Select_Promise_009
     * @tc.desc   : select with option folder parameter
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_009", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_009";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.FOLDER;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1000
     * @tc.name   : test_Documentpicker_Select_Promise_010
     * @tc.desc   : select with option mixed parameter
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Select_Promise_010", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_010";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.MIXED;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1100
     * @tc.name   : test_Documentpicker_Select_Promise_011
     * @tc.desc   : select with option authMode
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_011", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_011";
      let option = new picker.DocumentSelectOptions();
      option.authMode = false;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1200
     * @tc.name   : test_Documentpicker_Select_Promise_012
     * @tc.desc   : select with option authMode
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_012", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_012";
      let option = new picker.DocumentSelectOptions();
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1300
     * @tc.name   : test_Documentpicker_Select_Promise_013
     * @tc.desc   : select with option authMode
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_013", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_013";
      let option1 = new picker.DocumentSelectOptions();
      option1.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
      option1.authMode = false;
      await selectWithOption(testNum, done, option1);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1400
     * @tc.name   : test_Documentpicker_Select_Promise_014
     * @tc.desc   : select with option multiAuthMode
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_014", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_014";
      let option = new picker.DocumentSelectOptions();
      option.multiAuthMode = true;
      option.multiUriArray = [];
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1500
     * @tc.name   : test_Documentpicker_Select_Promise_015
     * @tc.desc   : select with option MergeTypeMode.DEFAULT
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_015", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_015";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.DEFAULT;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1600
     * @tc.name   : test_Documentpicker_Select_Promise_016
     * @tc.desc   : select with option MergeTypeMode.AUDIO
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_016", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_016";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.AUDIO;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1700
     * @tc.name   : test_Documentpicker_Select_Promise_017
     * @tc.desc   : select with option MergeTypeMode.VIDEO
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_017", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_017";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.VIDEO;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1800
     * @tc.name   : test_Documentpicker_Select_Promise_018
     * @tc.desc   : select with option MergeTypeMode.DOCUMENT
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_018", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_018";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.DOCUMENT;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_1900
     * @tc.name   : test_Documentpicker_Select_Promise_019
     * @tc.desc   : select with option MergeTypeMode.PICTURE
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("test_Documentpicker_Select_Promise_019", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Promise_019";
      let option = new picker.DocumentSelectOptions();
      option.mergeMode = picker.MergeTypeMode.PICTURE;
      await selectWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0000
     * @tc.name   : test_Documentpicker_Save_Promise_000
     * @tc.desc   : save image in Pictures
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 0
     */
    it("test_Documentpicker_Save_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_000";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.jpg"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0100
     * @tc.name   : test_Documentpicker_Save_Promise_001
     * @tc.desc   : save file in Documents
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_001";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.dat"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0200
     * @tc.name   : test_Documentpicker_Save_Promise_002
     * @tc.desc   : save mp4 in Videos
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Documentpicker_Save_Promise_002", Level.LEVEL3, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_002";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.mp4"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0300
     * @tc.name   : test_Documentpicker_Save_Promise_003
     * @tc.desc   : save mp3 in Audios
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Documentpicker_Save_Promise_003", Level.LEVEL3, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_003";
      let option = new picker.DocumentSaveOptions();
      option.newFileNames = ["DocumentViewPicker01.mp3"];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0400
     * @tc.name   : test_Documentpicker_Save_Promise_004
     * @tc.desc   : save uri in Pictures
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_004";
      let option = new picker.DocumentSaveOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test";
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0500
     * @tc.name   : test_Documentpicker_Save_Promise_005
     * @tc.desc   : save png in Pictures
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_005";
      let option = new picker.DocumentSaveOptions();
      option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1/202308171505.png";
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0600
     * @tc.name   : test_Documentpicker_Save_Promise_006
     * @tc.desc   : save suffix in Pictures
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_006";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.png', '.jpg'];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0700
     * @tc.name   : test_Documentpicker_Save_Promise_007
     * @tc.desc   : save suffix in Documents
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_007", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_007";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.pptx', '.docx', '.xlsx', '.txt'];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0800
     * @tc.name   : test_Documentpicker_Save_Promise_008
     * @tc.desc   : save mp4 in Videos
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_008", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_008";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.mp4'];
      await saveWithOption(testNum, done, option);
    });

    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0900
     * @tc.name   : test_Documentpicker_Save_Promise_009
     * @tc.desc   : save mp3 in Audios
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_009", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_009";
      let option = new picker.DocumentSaveOptions();
      option.fileSuffixChoices = ['.mp3'];
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_1000
     * @tc.name   : test_Documentpicker_Save_Promise_010
     * @tc.desc   : save option=DOWNLOAD
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
     */
    it("test_Documentpicker_Save_Promise_010", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Promise_010";
      let option = new picker.DocumentSaveOptions();
      option.pickerMode = picker.DocumentPickerMode.DOWNLOAD;
      await saveWithOption(testNum, done, option);
    });
    /**
     * @tc.number   : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_1100
     * @tc.name   : test_Documentpicker_Save_Promise_011
     * @tc.desc   : save option= picker.DocumentPickerMode.DEFAULT
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 1
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
