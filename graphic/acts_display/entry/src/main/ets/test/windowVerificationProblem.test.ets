/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';

export default function windowVerificationProblemTest(context, windowStage, abilityStorage) {
  describe('window_verification_problem_test', function () {
    console.log('describe window_verification_problem_test start!!!')

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4170
     * @tc.name      : testDisplayOffAdd_RepeatOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffAdd_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffAdd_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<number> = (data: number) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on("add", callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("add");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("add");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4180
     * @tc.name      : testDisplayOffAdd_UnregisteredOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffAdd_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffAdd_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("add");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4190
     * @tc.name      : testDisplayOffRemove_RepeatOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffRemove_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffRemove_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<number> = (data: number) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on("remove", callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("remove");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("remove");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
     * @tc.name      : testDisplayOffRemove_UnregisteredOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffRemove_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffRemove_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("remove");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4210
     * @tc.name      : testDisplayOffChange_RepeatOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffChange_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<number> = (data: number) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on("change", callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("change");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("change");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4220
     * @tc.name      : testDisplayOffChange_UnregisteredOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffChange_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("change");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4230
     * @tc.name      : testDisplayOffFoldStatusChange_RepeatOff
     * @tc.desc      : Enable the monitoring of the folding status change of the folding device
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldStatusChange_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffFoldStatusChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on('foldStatusChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4240
     * @tc.name      : testDisplayOffFoldStatusChange_UnregisteredOff
     * @tc.desc      : Enable the monitoring of the folding status change of the folding device
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldStatusChange_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffFoldStatusChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("foldStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4250
     * @tc.name      : testDisplayOffFoldDisplayModeChange_RepeatOff
     * @tc.desc      : Turn off monitoring for screen display mode changes on folding devices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldDisplayModeChange_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffFoldDisplayModeChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<display.FoldDisplayMode> = (data: display.FoldDisplayMode) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on('foldDisplayModeChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldDisplayModeChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldDisplayModeChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4260
     * @tc.name      : testDisplayOffFoldDisplayModeChange_UnregisteredOff
     * @tc.desc      : Turn off monitoring for screen display mode changes on folding devices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldDisplayModeChange_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffFoldDisplayModeChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("foldDisplayModeChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
  })
}
