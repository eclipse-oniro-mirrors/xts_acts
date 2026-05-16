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

export default function documentPickerCallback() {
  describe("documentPickerCallback", (): void => {
    beforeEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker.static', 'EntryAbility');
      await sleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext")! as common.UIAbilityContext;
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await sleep(500);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_000
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0000
     * @tc.desc   select with option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_000";
      let option: picker.DocumentSelectOptions = {};
      await selectWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0100
     * @tc.desc   select without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_001";
      await select(testNum, done, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0200
     * @tc.desc   select with option maxSelectNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_002";
      let option: picker.DocumentSelectOptions = {
        maxSelectNumber : 3 
      };
      await selectWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0300
     * @tc.desc   select with option defaultFilePathUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_003";
      let option: picker.DocumentSelectOptions = {
        defaultFilePathUri : "file://docs/storage/Users/currentUser/test/test1" 
      };
      await selectWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0400
     * @tc.desc   select with option image fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_004";
      let option: picker.DocumentSelectOptions= {
        fileSuffixFilters : ['.png', '.jpg'] 
      };
      await selectWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0500
     * @tc.desc   select with option docs fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_005";
      let option: picker.DocumentSelectOptions = {
        fileSuffixFilters : ['.pptx', '.docx', '.xlsx', '.txt'] 
      };
      await selectWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0600
     * @tc.desc   select with option video fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_006";
      let option: picker.DocumentSelectOptions = {
        fileSuffixFilters : ['.mp4']
      };
      await selectWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_007
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0700
     * @tc.desc   select with option audio fileSuffixFilters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_007";
      let option: picker.DocumentSelectOptions = {
        fileSuffixFilters : ['.mp3'] 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_008
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0800
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_008";
      let option: picker.DocumentSelectOptions = {
        multiAuthMode : true,
        multiUriArray : []
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_009
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_STATIC_0900
     * @tc.desc   select with option MergeTypeMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_009";
      let option: picker.DocumentSelectOptions = {
        mergeMode : picker.MergeTypeMode.DEFAULT 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_010
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1000
     * @tc.desc   select with option MergeTypeMode.AUDIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_010";
      let option: picker.DocumentSelectOptions = {
        mergeMode : picker.MergeTypeMode.AUDIO 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_011
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1100
     * @tc.desc   select with option MergeTypeMode.VIDEO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_011";
      let option: picker.DocumentSelectOptions = {
        mergeMode : picker.MergeTypeMode.VIDEO 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_012
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1200
     * @tc.desc   select with option MergeTypeMode.DOCUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_012";
      let option: picker.DocumentSelectOptions = {
        mergeMode : picker.MergeTypeMode.DOCUMENT 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_013
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1300
     * @tc.desc   select with option MergeTypeMode.PICTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_013";
      let option: picker.DocumentSelectOptions = {
        mergeMode : picker.MergeTypeMode.PICTURE 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_014
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1400
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_014";
      let option: picker.DocumentSelectOptions = {
        isEncryptionSupported : true 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Callback_static_015
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_1500
     * @tc.desc   select with option multiAuthMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Callback_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Select_Callback_static_015";
      let option: picker.DocumentSelectOptions = {
        isEncryptionSupported : false 
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_000
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0000
     * @tc.desc   save image in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Documentpicker_Save_Callback_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_000";
      let option: picker.DocumentSaveOptions = {
        newFileNames : ["DocumentViewPicker01.jpg"] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0100
     * @tc.desc   save file in Documents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_001";
      let option: picker.DocumentSaveOptions = {
        newFileNames : ["DocumentViewPicker01.dat"] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0200
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Callback_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_002";
      let option: picker.DocumentSaveOptions = {
        newFileNames : ["DocumentViewPicker01.mp4"] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0300
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Callback_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_003";
      let option: picker.DocumentSaveOptions = {
        newFileNames : ["DocumentViewPicker01.mp3"] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0400
     * @tc.desc   save without option, cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Documentpicker_Save_Callback_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let testNum = "documentpicker_save_Callback_static_004";
      await saveWithoutSelect(testNum, done, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0500
     * @tc.desc   save png in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_005";
      let option: picker.DocumentSaveOptions = {
        defaultFilePathUri : "file://docs/storage/Users/currentUser/test/test1/202308171505.png" 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0600
     * @tc.desc   save suffix in Pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_006";
      let option: picker.DocumentSaveOptions = {
        fileSuffixChoices : ['.png', '.jpg'] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_007
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0700
     * @tc.desc   save suffix in Documents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_007";
      let option: picker.DocumentSaveOptions = {
        fileSuffixChoices : ['.pptx', '.docx', '.xlsx', '.txt'] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_008
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0800
     * @tc.desc   save mp4 in Videos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_008";
      let option: picker.DocumentSaveOptions = {
        fileSuffixChoices : ['.mp4'] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_009
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Callback_static_0900
     * @tc.desc   save mp3 in Audios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_009";
      let option: picker.DocumentSaveOptions = {
        fileSuffixChoices : ['.mp3'] 
      };
      await saveWithOption(testNum, done, option, context!);
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_010
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_1000
     * @tc.desc   save option=DOWNLOAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_010";
      let option: picker.DocumentSaveOptions = {
        pickerMode : picker.DocumentPickerMode.DOWNLOAD 
      };
      let documentPicker = new picker.DocumentViewPicker(context!);
      documentPicker.save(option, (err: BusinessError<void> | null, documentSaveResult: Array<string> | undefined) => {
        if (err != undefined) {
          hilog.info(domain, tag, '%{public}s', `${testNum}: failed with err, code is: ${err?.code}, message is: ${err?.message}`);
          expect(false).assertTrue();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${testNum}: Result uri: ` + JSON.stringify(documentSaveResult));
        expect(documentSaveResult?.length == 1).assertTrue();
        done();
      });
    });
    /**
     * @tc.name   test_Documentpicker_Save_Callback_static_011
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_1100
     * @tc.desc   save option=DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Callback_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Callback_static_011";
      let option: picker.DocumentSaveOptions = {
        pickerMode : picker.DocumentPickerMode.DEFAULT 
      };
      await saveWithOption(testNum, done, option, context!);
    });
  });
}

async function select(testNum: string, done: () => void, context: common.UIAbilityContext) {
  try {
    let documentPicker = new picker.DocumentViewPicker(context);
    documentPicker.select((err: BusinessError<void> | null, documentSelectResult: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::select fail, err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::select documentSelectResult: ${JSON.stringify(documentSelectResult)}`);
      expect(documentSelectResult?.length == 0).assertTrue();
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

async function selectWithOption(testNum: string, done: () => void, option: picker.DocumentSelectOptions, context: common.UIAbilityContext) {
  try {
    let documentPicker = new picker.DocumentViewPicker(context);
    documentPicker.select(option, (err: BusinessError<void> | null, documentSelectResult: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption fail, err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption documentSelectResult: ${JSON.stringify(documentSelectResult)}`);
      expect(documentSelectResult?.length == 0).assertTrue();
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
    let documentPicker = new picker.DocumentViewPicker(context);
    documentPicker.save((err: BusinessError<void> | null, result: Array<string> | undefined) => {
      if (err != undefined) {
        hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
        done();
      } else {
        hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
        expect(result?.length == 0).assertTrue();
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
      done();
    });
    done();
  } catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithOption(testNum: string, done: () => void, option: picker.DocumentSaveOptions, context: common.UIAbilityContext) {
  try {
    let documentPicker = new picker.DocumentViewPicker(context);
    documentPicker.save(option, (err: BusinessError<void> | null, result: Array<string> | undefined) => {
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
