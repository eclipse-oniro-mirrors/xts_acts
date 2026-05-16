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

export default function documentPcPickerPromise() {
  describe("documentPcPickerPromise", (): void => {
    beforeEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.pcpicker.static', 'EntryAbility');
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext")! as common.UIAbilityContext;
      await sleep(500);
      await stopAbility('com.huawei.hmos.filemanager');
      await sleep(500);
    });

    /**
     * @tc.name   test_PcDocumentpicker_Select_Promise_static_000
     * @tc.number SUB_STORAGE_PCDOCUMENTPICKER_SELECT_Promise_static_0000
     * @tc.desc   select with option selectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_PcDocumentpicker_Select_Promise_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_PcDocumentpicker_Select_Promise_static_000";
      let option: picker.DocumentSelectOptions = {
        selectMode : picker.DocumentSelectMode.FILE
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_PcDocumentpicker_Select_Promise_static_001
     * @tc.number SUB_STORAGE_PCDOCUMENTPICKER_SELECT_Promise_static_0100
     * @tc.desc   select with option selectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_PcDocumentpicker_Select_Promise_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_PcDocumentpicker_Select_Promise_static_001";
      let option: picker.DocumentSelectOptions = {
        selectMode : picker.DocumentSelectMode.FOLDER
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_PcDocumentpicker_Select_Promise_static_002
     * @tc.number SUB_STORAGE_PCDOCUMENTPICKER_SELECT_Promise_static_0200
     * @tc.desc   select with option selectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_PcDocumentpicker_Select_Promise_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_PcDocumentpicker_Select_Promise_static_002";
      let option: picker.DocumentSelectOptions = {
        selectMode : picker.DocumentSelectMode.MIXED
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_PcDocumentpicker_Select_Promise_static_003
     * @tc.number SUB_STORAGE_PCDOCUMENTPICKER_SELECT_Promise_static_0300
     * @tc.desc   select with option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_PcDocumentpicker_Select_Promise_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_PcDocumentpicker_Select_Promise_static_003";
      let option: picker.DocumentSelectOptions = {};
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_PcDocumentpicker_Select_Promise_static_004
     * @tc.number SUB_STORAGE_PCDOCUMENTPICKER_SELECT_Promise_static_0400
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_PcDocumentpicker_Select_Promise_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_PcDocumentpicker_Select_Promise_static_004";
      let option: picker.DocumentSelectOptions = {
        authMode : false
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_PcDocumentpicker_Select_Promise_static_005
     * @tc.number SUB_STORAGE_PCDOCUMENTPICKER_SELECT_Promise_static_0500
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_PcDocumentpicker_Select_Promise_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let testNum = "test_PcDocumentpicker_Select_Promise_static_005";
      let option: picker.DocumentSelectOptions = {
        authMode : true
      };
      await selectWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_static_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Promise_static_0100
     * @tc.desc   save autoCreateEmptyFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Documentpicker_Save_Promise_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Promise_static_001";
      let option: picker.DocumentSaveOptions = {
        autoCreateEmptyFile : true
      };
      await saveWithOption(testNum, done, option, context!);
    });

    /**
     * @tc.name   test_Documentpicker_Save_Promise_static_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_Promise_static_0200
     * @tc.desc   save autoCreateEmptyFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Documentpicker_Save_Promise_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let testNum = "test_Documentpicker_Save_Promise_static_002";
      let option: picker.DocumentSaveOptions = {
        autoCreateEmptyFile : false
      };
      await saveWithOption(testNum, done, option, context!);
    });
  });
}

async function selectWithOption(testNum: string, done: () => void, option: picker.DocumentSelectOptions, context: common.UIAbilityContext) {
  try {
    let documentPicker = new picker.DocumentViewPicker(context);
    documentPicker.select(option).then((documentSelectResult: Array<string>) => {
      hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption result: ${JSON.stringify(documentSelectResult)}`);
      expect(documentSelectResult.length == 0).assertTrue();
      done();
    }).catch((err: Error): void => {
      hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
      done();
    })
    done();
  } catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}

async function saveWithOption(testNum: string, done: () => void, option: picker.DocumentSaveOptions, context: common.UIAbilityContext) {
  try {
    let documentPicker = new picker.DocumentViewPicker(context);
    documentPicker.save(option).then((result: Array<string>) => {
      hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
      expect(result.length == 0).assertTrue();
      done();
    }).catch((err: Error): void => {
      hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
      done();
    })
    done();
  } catch (error) {
    hilog.info(domain, tag, '%{public}s', `${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
    expect(false).assertTrue();
    done();
  }
}
