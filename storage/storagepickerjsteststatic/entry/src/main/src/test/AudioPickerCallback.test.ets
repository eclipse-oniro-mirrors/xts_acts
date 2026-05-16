/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeEach, afterEach } from "../../../hypium/index";
import { sleep, startAbility, stopAbility } from './Common';
import picker from '@ohos.file.picker';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000;
let tag: string = 'testTag';
let context: common.UIAbilityContext | undefined;
let windowClass: window.Window;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function audioPickerCallback() {
  describe("audioPickerCallback", (): void => {
    beforeEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker.static', 'EntryAbility');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext")! as common.UIAbilityContext;
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await stopAbility('com.huawei.hms.musicservice');
      await sleep(500);
    });

    /**
     * @tc.name   test_Audiopicker_Select_Callback_static_000
     * @tc.number SUB_STORAGE_AUDIOPICKER_SELECT_Callback_static_0000
     * @tc.desc   select with option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Select_Callback_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Audiopicker_Select_Callback_static_000";
      let option: picker.AudioSelectOptions = {};
      let dirName: string = "Audios";
      let fileName: string = "01.mp3";
      await selectWithOption(testNum, done, option, dirName, fileName, context!);
    });
    /**
     * @tc.name   test_Audiopicker_Select_Callback_static_001
     * @tc.number SUB_STORAGE_AUDIOPICKER_SELECT_Callback_static_0100
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Select_Callback_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Audiopicker_Select_Callback_static_001";
      let dirName: string = "Audios";
      let fileName: string = "01.mp3";
      await select(testNum, done, dirName, fileName, context!);
    });
    /**
     * @tc.name   test_Audiopicker_Save_Callback_static_000
     * @tc.number SUB_STORAGE_AUDIOPICKER_SAVE_Callback_static_0000
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Save_Callback_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Audiopicker_Save_Callback_static_000";
      let option: picker.AudioSaveOptions = {
        newFileNames : ["AudioViewPicker01.mp3"]
      };
      let saveDir: string = "Audios";
      await saveWithOption(testNum, done, option, saveDir, context!);
    });
    /**
     * @tc.name   test_Audiopicker_Save_Callback_static_001
     * @tc.number SUB_STORAGE_AUDIOPICKER_SAVE_Callback_static_0100
     * @tc.desc   save without option, cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Audiopicker_Save_Callback_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Audiopicker_Save_Callback_static_001";
      await saveWithoutSelect(testNum, done, context!);
    });
  });
}

async function select(testNum: string, done: () => void, dirName: string, fileName: string, context: common.UIAbilityContext) {
  try {
    let audioPicker = new picker.AudioViewPicker(context);
    audioPicker.select((err: BusinessError<void> | null, result: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::select fail, err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::select result: ${JSON.stringify(result)}`);
      expect(result?.length == 0).assertTrue();
      done();
    });
    done();
  }
  catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::select error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function selectWithOption(testNum: string, done: () => void, option: picker.AudioSelectOptions, dirName: string, fileName: string, context: common.UIAbilityContext) {
  try {
    let audioPicker = new picker.AudioViewPicker(context);
    audioPicker.select(option, (err: BusinessError<void> | null, result: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption fail, err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
      expect(result?.length == 0).assertTrue();
      done();
    });
    done();
  }
  catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}


async function saveWithoutSelect(testNum: string, done: () => void, context: common.UIAbilityContext) {
  try {
    let audioPicker = new picker.AudioViewPicker(context);
    audioPicker.save((err: BusinessError<void> | null, result: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
      expect(result?.length == 0).assertTrue();
      done();
    });
    done();
  }
  catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithOption(testNum: string, done: () => void, option: picker.AudioSaveOptions, dirName: string, context: common.UIAbilityContext) {
  try {
    let audioPicker = new picker.AudioViewPicker(context);
    audioPicker.save(option, (err: BusinessError<void> | null, result: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
      expect(result?.length == 0).assertTrue();
      done();
    });
    done();
  }
  catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}
