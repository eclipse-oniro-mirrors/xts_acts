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
     * @tc.name   test_Audiopicker_Select_Promise_000
     * @tc.number SUB_STORAGE_AUDIOPICKER_SELECT_PROMISE_0000
     * @tc.desc   select with option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Select_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Select_Promise_000";
      let option = new picker.AudioSelectOptions();
      let dirName = "Audios";
      let fileName = "01.mp3";
      await selectWithOption(testNum, done, option, dirName, fileName);
    });
    /**
     * @tc.name   test_Audiopicker_Select_Promise_001
     * @tc.number SUB_STORAGE_AUDIOPICKER_SELECT_PROMISE_0100
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Select_Promise_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Select_Promise_001";
      let dirName = "Audios";
      let fileName = "01.mp3";
      await select(testNum, done, dirName, fileName);
    });
    /**
     * @tc.name   test_Audiopicker_Select_Promise_002
     * @tc.number SUB_STORAGE_AUDIOPICKER_SELECT_PROMISE_0200
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   test_Audiopicker_Save_Promise_000
     * @tc.number SUB_STORAGE_AUDIOPICKER_SAVE_PROMISE_0000
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Save_Promise_000", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Save_Promise_000";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = ["AudioViewPicker01.mp3"];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });
    /**
     * @tc.name   test_Audiopicker_Save_Promise_001
     * @tc.number SUB_STORAGE_AUDIOPICKER_SAVE_PROMISE_0100
     * @tc.desc   save without option, cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Save_Promise_001", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Save_Promise_001";
      await saveWithoutSelect(testNum, done);
    });

    /**
     * @tc.name   test_Audiopicker_Save_Promise_002
     * @tc.number SUB_STORAGE_AUDIOPICKER_SAVE_PROMISE_0200
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Save_Promise_002", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Save_Promise_002";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = [];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });

    /**
     * @tc.name   test_Audiopicker_Save_Promise_003
     * @tc.number SUB_STORAGE_AUDIOPICKER_SAVE_PROMISE_0300
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Save_Promise_003", Level.LEVEL0, async (done: Function) => {
      let testNum = "test_Audiopicker_Save_Promise_003";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = [""];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });

    /**
    * @tc.name   AudioViewPicker_select_000
    * @tc.number SUB_DF_AudioViewPicker_select_0000
    * @tc.desc   Test AudioViewPicker.select() interfaces with null parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_select_000', Level.LEVEL3, async (done: Function) => {
      try {
        await new picker.AudioViewPicker().select(null).then((result) => {
          console.info(`AudioViewPicker_select_000 result: ${JSON.stringify(result)}`);
          expect(result).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(`AudioViewPicker_select_000 err: ${JSON.stringify(err)}`);
          done();
        });
        done();
      } catch (e) {
        console.log('AudioViewPicker_select_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.name   AudioViewPicker_select_001
    * @tc.number SUB_DF_AudioViewPicker_select_0010
    * @tc.desc   Test AudioViewPicker.select() interfaces with undefined parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_select_001', Level.LEVEL3, async (done: Function) => {
      try {
        new picker.AudioViewPicker().select(undefined).then((result) => {
          console.info(`AudioViewPicker_select_001 result: ${JSON.stringify(result)}`);
          expect(result.length === 0).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(`AudioViewPicker_select_001 err: ${JSON.stringify(err)}`);
          done();
        });
        done();
      } catch (e) {
        console.log('AudioViewPicker_select_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.name   AudioViewPicker_save_000
    * @tc.number SUB_DF_AudioViewPicker_save_0000
    * @tc.desc   Test AudioViewPicker.save() interfaces with null parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_save_000', Level.LEVEL3, async (done: Function) => {
      try {
        await new picker.AudioViewPicker().save(null).then((result) => {
          console.info(`AudioViewPicker_save_000 result: ${JSON.stringify(result)}`);
          expect(result).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(`AudioViewPicker_save_000 err: ${JSON.stringify(err)}`);
          done();
        });
        done();
      } catch (e) {
        console.log('AudioViewPicker_save_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.name   AudioViewPicker_save_001
    * @tc.number SUB_DF_AudioViewPicker_save_0010
    * @tc.desc   Test AudioViewPicker.save() interfaces with undefined parameter
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_save_001', Level.LEVEL3, async (done: Function) => {
      try {
        new picker.AudioViewPicker().save(undefined).then((result) => {
          console.info(`AudioViewPicker_save_001 result: ${JSON.stringify(result)}`);
          expect(result.length === 0).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(`AudioViewPicker_save_001 err: ${JSON.stringify(err)}`);
          done();
        });
        done();
      } catch (e) {
        console.log('AudioViewPicker_save_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.name   AudioViewPicker_save_002
    * @tc.number SUB_DF_AudioViewPicker_save_0020
    * @tc.desc   Test AudioViewPicker.save() interfaces with empty newFileNames array
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_save_002', Level.LEVEL3, async (done: Function) => {
      let testNum = "AudioViewPicker_save_002";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = [];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });

    /**
    * @tc.name   AudioViewPicker_save_003
    * @tc.number SUB_DF_AudioViewPicker_save_0030
    * @tc.desc   Test AudioViewPicker.save() interfaces with non-empty newFileNames array
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_save_003', Level.LEVEL3, async (done: Function) => {
      let testNum = "AudioViewPicker_save_002";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = ['test.mp3'];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });

    /**
    * @tc.name   AudioViewPicker_save_004
    * @tc.number SUB_DF_AudioViewPicker_save_0040
    * @tc.desc   Test AudioViewPicker.save() interfaces with empty newFileNames string
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('AudioViewPicker_save_004', Level.LEVEL3, async (done: Function) => {
      let testNum = "AudioViewPicker_save_002";
      let option = new picker.AudioSaveOptions();
      option.newFileNames = [''];
      let saveDir = "Audios";
      await saveWithOption(testNum, done, option, saveDir);
    });
  });
}


async function select(testNum: string, done: Function, dirName: string, fileName: string) {
  try {
    let audioPicker = new picker.AudioViewPicker();
    audioPicker.select().then((result) => {
      console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
      expect(result.length === 0).assertTrue();
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
      done();
      return;
    });
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
      expect(result.length === 0).assertTrue();
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
      done();
      return;
    });
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
      expect(result.length === 0).assertTrue();
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
      done();
      return;
    });
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
      expect(result.length === 0).assertTrue();
      done();
    }).catch((err: Error) => {
      console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
      done();
      return;
    });
    done();
  }
  catch (error) {
    console.info(`${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}