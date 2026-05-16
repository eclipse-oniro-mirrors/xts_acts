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

export default function documentpcPickerPromise(abilityContext: Context) {
  describe("documentpcPickerPromise", () => {
    afterEach(async () => {
      await sleep(500);
      await startAbility('ohos.acts.storage.picker', 'TestAbility');
      await sleep(500);
      await stopAbility('com.ohos.filepicker');
      await sleep(500);
    })

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Promise_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_PROMISE_0100
     * @tc.desc   select with option file parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Promise_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Promise_001";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.FILE;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Promise_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_PROMISE_0200
     * @tc.desc   select with option folder parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Promise_002", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Promise_002";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.FOLDER;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Promise_003
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_PROMISE_0300
     * @tc.desc   select with option mixed parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Promise_003", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Promise_003";
      let option = new picker.DocumentSelectOptions();
      option.selectMode = picker.DocumentSelectMode.MIXED;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Promise_004
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_PROMISE_0400
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Promise_004", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Promise_004";
      let option = new picker.DocumentSelectOptions();
      option.authMode = false;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Promise_005
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_PROMISE_0500
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Promise_005", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Promise_005";
      let option = new picker.DocumentSelectOptions();
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Select_Pc_Promise_006
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SELECT_PC_PROMISE_0600
     * @tc.desc   select with option authMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Select_Pc_Promise_006", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Select_Pc_Promise_006";
      let option1 = new picker.DocumentSelectOptions();
      option1.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
      option1.authMode = false;
      try {
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.select(option1).then((result) => {
          console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Save_Pc_Promise_001
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PC_PROMISE_0100
     * @tc.desc   save autoCreateEmptyFile=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Pc_Promise_001", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Pc_Promise_001";
      let option = new picker.DocumentSaveOptions();
      option.autoCreateEmptyFile = true;
      try{
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.save(option).then((result) => {
          console.info(`${testNum}:: saveWithOption result: ${JSON.stringify(result)}`);
          console.info('test_Documentpicker_Save_Pc_Promise_001 result.length: ' + result.length);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}:: saveWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}:: saveWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_Documentpicker_Save_Pc_Promise_002
     * @tc.number SUB_STORAGE_DOCUMENTPICKER_SAVE_PC_PROMISE_0200
     * @tc.desc   save autoCreateEmptyFile=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Documentpicker_Save_Pc_Promise_002", Level.LEVEL1, async (done: Function) => {
      let testNum = "test_Documentpicker_Save_Pc_Promise_002";
      let option = new picker.DocumentSaveOptions();
      option.autoCreateEmptyFile = false;
      try{
        let documentPicker = new picker.DocumentViewPicker();
        documentPicker.save(option).then((result) => {
          console.info(`${testNum}:: saveWithOption result: ${JSON.stringify(result)}`);
          console.info('test_Documentpicker_Save_Pc_Promise_002 result.length: ' + result.length);
          expect(result.length == 0).assertTrue();
        }).catch((err: Error) => {
          console.info(`${testNum}:: saveWithOption err: ${JSON.stringify(err)}`);
        })
        done();
      } catch (error) {
        console.info(`${testNum}:: saveWithOption error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });
  });
}