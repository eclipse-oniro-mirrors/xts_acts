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

import { describe, beforeAll, it, expect , TestType, Size, Level} from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import { Context } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';

function unexpectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function,) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  try {
    expect(TRUE_FLAG).assertFail();
  } catch (error) {
    console.info(`ohosWindow.on ${JSON.stringify(error)}`)
  }
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowCallbackTest() {
  describe('windowCallback_test', () => {
    console.log('describe testets start!!')
    let context : common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;

    const TRUE_FLAG = true;
    let currentDeviceIsRk = false;
    beforeAll(() => {
      
    })
    /**
     * @tc.name   testGetCutoutInfo_Callbcak
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0490
     * @tc.desc   Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCutoutInfo_Callbcak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetCutoutInfo_Callbcak';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let dpClass: display.Display = display.getDefaultDisplaySync();
      expect(!!dpClass).assertTrue();
      dpClass.getCutoutInfo((err, data) => {
        if (err && err.code) {
          console.log(caseName + ', err : ' + JSON.stringify(err)+',msg:'+ JSON.stringify(err.message));
          expect(err.message!=null).assertTrue();
          unexpectedError(TRUE_FLAG, err, caseName, 'displayClass.getCutoutInfo', done);
        } else {
          console.info(msgStr + 'Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
          done();
        }
      })
    })
    /**
     * @tc.name   testOrientation_Enum
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2310
     * @tc.desc   Test the enumeration value of Orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrientation_Enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOrientation_Enum';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.log(msgStr + 'display.orientation:' + JSON.stringify('PORTRAIT: ' + display.Orientation.PORTRAIT + ';LANDSCAPE: ' + display.Orientation.LANDSCAPE + ';PORTRAIT_INVERTED: ' + display.Orientation.PORTRAIT_INVERTED + ';LANDSCAPE_INVERTED: ' + display.Orientation.LANDSCAPE_INVERTED));
      try {
        expect(0).assertEqual(display.Orientation.PORTRAIT);
        expect(1).assertEqual(display.Orientation.LANDSCAPE);
        expect(2).assertEqual(display.Orientation.PORTRAIT_INVERTED);
        expect(3).assertEqual(display.Orientation.LANDSCAPE_INVERTED);
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(msgStr + 'Orientation error :' + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testGetCutoutInfo_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.desc   Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCutoutInfo_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetCutoutInfo_Promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let dpClass = display.getDefaultDisplaySync();
      expect(!!dpClass).assertTrue();
      dpClass.getCutoutInfo().then((data: display.CutoutInfo) => {
        console.info('Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
        done();
      }).catch((err: BusinessError) => {
        console.log(caseName + ', err : ' + JSON.stringify(err)+',msg:'+ JSON.stringify(err.message));
        expect(err.message!=null).assertTrue();
        unexpectedError(TRUE_FLAG, err, caseName, 'displayClass.getCutoutInfo', done);
      });
    })
  })
}
