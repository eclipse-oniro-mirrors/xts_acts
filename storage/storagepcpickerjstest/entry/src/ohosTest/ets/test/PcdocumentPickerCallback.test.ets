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

export default function documentpcPickerCallback(abilityContext: Context) {
  describe("documentpcPickerCallback", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.ohos.filepicker');
      await sleep(500);
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Callback_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_CALLBACK_0100
     * @tc.desc   select with option file parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Callback_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Callback_001";
      let option: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      console.log('test_Documentpicker_Select_Pc_Callback_001::::::');
      option.selectMode = picker.DocumentSelectMode.FILE;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option, (err, result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        });
        done();
      }
      catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Callback_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_CALLBACK_0200
     * @tc.desc   select with option folder parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Callback_002", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Callback_002";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.FOLDER;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option, (err, result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        });
        done();
      }
      catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Callback_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_CALLBACK_0300
     * @tc.desc   select with option mixed parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Callback_003", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Callback_003";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.MIXED;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option, (err, result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        });
        done();
      }
      catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Callback_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_CALLBACK_0400
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Callback_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Callback_004";
      let option = new picker.DocumentSelectOptions();
      option.authMode = false;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option, (err, result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        });
        done();
      }
      catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Callback_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_CALLBACK_0500
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Callback_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Callback_005";
      let option = new picker.DocumentSelectOptions();
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option, (err, result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        });
        done();
      }
      catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Callback_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_CALLBACK_0600
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Callback_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Callback_006";
      let option1 = new picker.DocumentSelectOptions();
      option1.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
      option1.authMode = false;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option1, (err, result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        });
        done();
      }
      catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Save_Pc_Callback_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PC_CALLBACK_0100
     * @tc.desc   test getSelectdIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Pc_Callback_001", Level.LEVEL1, async (done: Function) => {
      try {
        let documentPicker = new picker.DocumentViewPicker();
        let option = new picker.DocumentSaveOptions();
        documentPicker.save(option, (err, result) => {
          expect(result.length == 0).assertTrue();
          let index = documentPicker.getSelectedIndex();
          console.info('test_Documentpicker_Save_Pc_Callback_001 getSelectedIndex:' + index);
          if (option.fileSuffixChoices != undefined) {
            if (option.fileSuffixChoices?.length || index == -1){
              console.error('test_Documentpicker_Save_Pc_Callback_001 getSelectdIndex:' + index);
            } else {
              let suffix = option.fileSuffixChoices[index];
              console.info('test_Documentpicker_Save_Pc_Callback_001 suffix:' + suffix);
            }
          }
        });
        done();
      }
      catch (error) {
        console.info(`test_Documentpicker_Save_Pc_Callback_001::saveWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Save_Pc_Callback_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PC_CALLBACK_0200
     * @tc.desc   save autoCreateEmptyFile=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Pc_Callback_002", Level.LEVEL1, async (done: Function) => {
      let documentPicker = new picker.DocumentViewPicker();
      let option = new picker.DocumentSaveOptions();
      option.autoCreateEmptyFile = true;
      try{
        documentPicker.save(option, (err, documentSaveResult) => {
          console.info('test_Documentpicker_Save_Pc_Callback_002 documentPicker.save successfully, documentSaveResult uri: ' + JSON.stringify(documentSaveResult));
          console.info('test_Documentpicker_Save_Pc_Callback_002 documentSaveResult.length: ' + documentSaveResult.length);
          expect(documentSaveResult.length == 0).assertTrue();
        });
        done();
      } catch (error) {
        console.error(`test_Documentpicker_Save_Pc_Callback_002 failed with err, code is: ${error.code}, message is: ${error.message}`);
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Save_Pc_Callback_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PC_CALLBACK_0300
     * @tc.desc   save autoCreateEmptyFile=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Pc_Callback_003", Level.LEVEL1, async (done: Function) => {
      let documentPicker = new picker.DocumentViewPicker();
      let option = new picker.DocumentSaveOptions();
      option.autoCreateEmptyFile = false;
      try{
        documentPicker.save(option, (err, documentSaveResult) => {
          console.info('test_Documentpicker_Save_Pc_Callback_003 documentPicker.save successfully, documentSaveResult uri: ' + JSON.stringify(documentSaveResult));
          console.info('test_Documentpicker_Save_Pc_Callback_003 documentSaveResult.length: ' + documentSaveResult.length);
          expect(documentSaveResult.length == 0).assertTrue();
        });
        done();
      } catch (error) {
        console.error(`test_Documentpicker_Save_Pc_Callback_003 failed with err, code is: ${error.code}, message is: ${error.message}`);
        done();
      }
    });
  });
}