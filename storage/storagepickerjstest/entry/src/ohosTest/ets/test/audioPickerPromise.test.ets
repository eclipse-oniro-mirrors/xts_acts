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

import { afterEach, describe, expect, it, Level} from '@ohos/hypium';
import { sleep, startAbility, stopAbility } from './Common'
import picker from '@ohos.file.picker';

export default function audioPickerPromise(abilityContext: Context) {
  describe("audioPickerPromise", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await stopAbility('com.huawei.hms.musicservice');
      await stopAbility('com.ohos.filepicker');
      await sleep(500);
    });

    /**
     * @tc.number   : SUB_STORAGE_AUDIOPICKER_SELECT_PROMISE_0000
     * @tc.name   : test_Audiopicker_Select_Promise_000
     * @tc.desc   : select with option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 0
     */
    it("test_Audiopicker_Select_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Select_Promise_000";
      let option = new picker.AudioSelectOptions();
      let dirName = "Audios";
      let fileName = "01.mp3";
      await selectWithOption(testNum, done, option, dirName, fileName);
    });
    /**
     * @tc.number   : SUB_STORAGE_AUDIOPICKER_SELECT_PROMISE_0100
     * @tc.name   : test_Audiopicker_Select_Promise_001
     * @tc.desc   : select without option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Audiopicker_Select_Promise_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Select_Promise_001";
      let dirName = "Audios";
      let fileName = "01.mp3";
      await select(testNum, done, dirName, fileName);
    });
    /**
     * @tc.number   : SUB_STORAGE_AUDIOPICKER_SELECT_PROMISE_0200
     * @tc.name   : test_Audiopicker_Select_Promise_002
     * @tc.desc   : select without option
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 3
     */
    it("test_Audiopicker_Select_Promise_002", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Select_Promise_002";
      let option = new picker.AudioSelectOptions();
      option.maxSelectNumber = 3;
      let dirName = "Audios";
      let fileName = "01.mp3";
      await selectWithOption(testNum, done, option, dirName, fileName);
    });
    /**
     * @tc.number   : SUB_STORAGE_AUDIOPICKER_SAVE_PROMISE_0000
     * @tc.name   : test_Audiopicker_Save_Promise_000
     * @tc.desc   : save mp3 in Audios
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 0
     */
    it("test_Audiopicker_Save_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Save_Promise_000";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = ["AudioViewPicker01.mp3"];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });
    /**
     * @tc.number   : SUB_STORAGE_AUDIOPICKER_SAVE_PROMISE_0100
     * @tc.name   : test_Audiopicker_Save_Promise_001
     * @tc.desc   : save without option, cancel
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level   : Level 0
     */
    it("test_Audiopicker_Save_Promise_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Save_Promise_001";
      await saveWithoutSelect(testNum, done);
    });
  });
}


async function select(testNum: string, done: Function, dirName: string, fileName: string) {
  try {
    let audioPicker = new picker.AudioViewPicker();
    audioPicker.select().then((result) => {
      console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
      done();
      return;
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


async function selectWithOption(testNum: string, done: Function, option: picker.AudioSelectOptions, dirName: string, fileName: string) {
  try {
    let audioPicker = new picker.AudioViewPicker();
    audioPicker.select(option).then((result) => {
      console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
      done();
      return;
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
    let audioPicker = new picker.AudioViewPicker();
    audioPicker.save().then((result) => {
      console.info(`${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
      done();
      return;
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

async function saveWithOption(testNum: string, done: Function, option: picker.AudioSaveOptions, dirName: string) {
  try {
    let audioPicker = new picker.AudioViewPicker();
    audioPicker.save(option).then((result) => {
      console.info(`${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
      done();
      return;
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