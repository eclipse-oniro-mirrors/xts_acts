/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { Callback } from '@ohos.base';

export default function windowPromiseTest(context, windowStage, abilityStorage) {
  describe('windowPermissionCheck_test', function () {
    console.log('describe windowPermissionCheck_test start!!!')

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0010
     * @tc.name      : testCreateFloatWindowPermission_Promise
     * @tc.desc      : create Floating window permission check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateFloatWindowPermission_Promise', 0, async function () {
      let caseName = 'testCreateFloatWindowPermission_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testCreateFloatWindowPermission_Promise",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      try {
        await ohosWindow.createWindow(windowConfig).then((data) => {
          console.info(msgStr +'Succeeded in creating the window. Data:' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr +'Failed to create the Window. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        });
      } catch (exception) {
        console.error(msgStr +'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(201);
      }
    })
    /**
     /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0020
     * @tc.name      : testCreateFloatWindowPermission_Callback
     * @tc.desc      : create Floating window permission check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateFloatWindowPermission_Callback', 0, async function (done) {
      let caseName = 'testCreateFloatWindowPermission_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testCreateFloatWindowPermission_Callback",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      try {
        ohosWindow.createWindow(windowConfig, (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr +'Failed to create the window. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done()
            return;
          }
          console.info(msgStr +'Succeeded in creating the window. Data: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr +'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(201);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0030
     * @tc.name      : testSetWindowPrivacyModePermission_Callback
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowPrivacyModePermission_Callback', 0, async function (done) {
      let caseName = 'testSetWindowPrivacyModePermission_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetWindowPrivacyModePermission_Callback",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      });
      expect(!!win).assertTrue();
      try {
        win.setWindowPrivacyMode(true, async(err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr +'Failed to set the window to privacy mode. Cause:' + JSON.stringify(err));
            await win.destroyWindow()
            expect(err.code).assertEqual(201);
            done()
            return;
          }
          console.info(msgStr +'Succeeded in setting the window to privacy mode.');
          expect().assertFail();
          await win.destroyWindow()
          done();
        });
      } catch (exception) {
        console.error(msgStr +'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        await win.destroyWindow()
        expect(exception.code).assertEqual(201);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0040
     * @tc.name      : testSetWindowPrivacyModePermission_Promise
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowPrivacyModePermission_Promise', 0, async function () {
      let caseName = 'testSetWindowPrivacyModePermission_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetWindowPrivacyModePermission_Promise",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      try {
        await win.setWindowPrivacyMode(true).then(async() => {
          console.info(msgStr +'Succeeded in setting the window to privacy mode.');
          await win.destroyWindow()
          expect().assertFail();
        }).catch(async(err: BusinessError) => {
          console.error(msgStr +'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          await win.destroyWindow()
          expect(err.code).assertEqual(201);
        });
      } catch (exception) {
        console.error(msgStr +'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        await win.destroyWindow()
        expect(exception.code).assertEqual(201);
      }
    })
  })
}