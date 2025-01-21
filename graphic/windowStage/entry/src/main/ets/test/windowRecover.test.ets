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
import screenManager from '@ohos.screen';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';

export default function windowRecoverTest(context, windowStage, abilityStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowRecover_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;
    var commonRGBColorArr = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
    var commonNUMBERColorArr = ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    var commonKEYColorArr = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];
    var appWindowTypeArr = [];
    var appWindowTypeDic = {
      'TYPE_BASE': 0,
      'TYPE_APP': 0,
      'TYPE_APP_SUB_WINDOW': 1,
    };
    var systemWindowValueArr = [];
    var systemWindowTypeArr = [];
    var systemWindowTypeDicArr = [];
    var systemWindowTypeDic = {
      'TYPE_FLOAT': 8,
    }
    var windowLayoutModeArr = [];
    var windowLayoutModeDic = {
      'WINDOW_LAYOUT_MODE_TILE': 1,
      'WINDOW_LAYOUT_MODE_CASCADE': 0
    };
    var windowCount = 2022;
    var listenerStatus = {
      ready: 'ready',
      pending: 'pending',
      finished: 'finished'
    };
    var listenerData = {
      on: false,
      typeStr: '',
    };
    var newWindowObj = null;
    const WINDOW_NAME = 'windowName';

    beforeAll(function () {
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsunittest beforeall systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowValueArr = Object.keys(systemWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
    })

    function expectedError(error, caseName, apiName, done, code) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      if (error.code == code) {
        expect(TRUE_FLAG).assertTrue();
      }
      done();
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      expect(TRUE_FLAG).assertFail();
      done();
    }

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
     * @tc.name      : testRecover
     * @tc.desc      : test the function of Recover
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testRecover', 0, async function (done) {
        let msgStr = 'testRecover';
        console.log(msgStr + ' begin');
        ohosWindow.getLastWindow(context).then(wnd => {
          console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
          expect(wnd != null).assertTrue();
          try {
            let promise = wnd.recover();
            console.log(msgStr + "after recover")
            promise.then(() => {
              console.info(msgStr + 'Succeeded in recovering the window.');
              expect(true).assertTrue()
              done()
            }).catch((err: BusinessError) => {
              console.error(msgStr + 'Failed to recover the window. Cause: ' + JSON.stringify(err));
              if (err.code == 1300001 || err.code == 801) {
                expect(true).assertTrue()
                done()
              } else {
                expect().assertFail()
                done()
              }
            });
          } catch (exception) {
            console.error(msgStr + ' Failed to recover the window. Cause: ' + JSON.stringify(exception));
            if (exception.code == 1300001 || exception.code == 801) {
              expect(true).assertTrue()
              done()
            } else {
              expect().assertFail();
              done();
            }
          }
      })
    })
  })
}
