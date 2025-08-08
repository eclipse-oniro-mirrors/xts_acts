/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';
import window from '@ohos.window';

function expectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function, code: number) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  if (error.code == code) {
    expect(TRUE_FLAG).assertTrue();
  }
  done();
}

function unexpectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  expect(TRUE_FLAG).assertFail();
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise < string > (resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowFocusTest() {
  describe('windowFocus_test', () => {
    console.log('describe window_api_test start!!!')
    let systemWindowTypeArr: Array<string> = [];
    let systemWindowTypeDicArr: Array<string> = [];
    let systemWindowTypeDic: Record<string, number> = {
      'TYPE_FLOAT': 8,
    }
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let windowClass: window.Window;
    let isAutoWindow:string = '';
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      windowClass = windowStage.getMainWindowSync();
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.DEVICE_SHARED);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
    })

    /**
     * @tc.number    : SUB_BASIC_ONWINDOWHIGHLIGHTCHANGE_0100
     * @tc.name      : test_OH_OnWindowHighlightChange_One
     * @tc.desc      : test_OH_OnWindowHighlightChange_One
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_OH_OnWindowHighlightChange_One', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = 'test_OH_OnWindowHighlightChange_One ';
      let count = 0;
      let cb1 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange, isBool = ' + isBool)
        if (isBool) {
          count++;
        }
      }
      try {
        windowClass.on('windowHighlightChange', cb1)
        windowClass.on('windowHighlightChange', cb1)

        let win1 = await windowStage.createSubWindow('win1');
        await win1.setUIContent('testability/pages/Index');
        await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        await win1.showWindow()
        await sleep(500)
        expect(count == 0).assertTrue()

        await win1.destroyWindow()
        await sleep(300)
        expect(count == 1).assertTrue()

        windowClass.off('windowHighlightChange')
        done()
      }catch (exception) {
        console.error(msg + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code == 801) {
          done()
        }
      }

    })

    /**
     * @tc.number    : SUB_BASIC_ONWINDOWHIGHLIGHTCHANGE_0200
     * @tc.name      : test_OH_OnWindowHighlightChange_Mul
     * @tc.desc      : test_OH_OnWindowHighlightChange_Mul
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_OH_OnWindowHighlightChange_Mul', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msg = 'test_OH_OnWindowHighlightChange_Mul ';
      let count = 0;
      let cb1 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb1, isBool = ' + isBool);
        if (isBool) {
          count++;
        }
      }
      let cb2 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb2, isBool = ' + isBool);
        if (isBool) {
          count++;
        }
      }
      try {
        windowClass.on('windowHighlightChange', cb1)
        windowClass.on('windowHighlightChange', cb2)

        let win1 = await windowStage.createSubWindow('win1');
        await win1.setUIContent('testability/pages/Index');
        await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        await win1.showWindow()
        await sleep(300)
        expect(count == 0).assertTrue()

        await win1.destroyWindow()
        await sleep(300)
        expect(count == 2).assertTrue()

        windowClass.off('windowHighlightChange')
        done()
      }catch (exception) {
        console.error(`Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code == 801) {
          done()
        } else {
          expect().assertFail()
          done()
        }
      }

    })

    /**
     * @tc.number    : SUB_BASIC_OFFWINDOWHIGHLIGHTCHANGE_0300
     * @tc.name      : test_OH_OffWindowHighlightChange_clear_all
     * @tc.desc      : test_OH_OffWindowHighlightChange_clear_all
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_OffWindowHighlightChange_clear_all', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msg = 'test_OH_OffWindowHighlightChange_clear_all '
      let count = 0
      let cb1 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb1, isBool = ' + isBool);
        if (isBool) {
          count++;
        }
      }
      let cb2 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb2, isBool = ' + isBool);
        if (isBool) {
          count++;
        }
      }
      try {
        windowClass.on('windowHighlightChange', cb1)
        windowClass.on('windowHighlightChange', cb2)

        windowClass.off('windowHighlightChange')
        let win1 = await windowStage.createSubWindow('win1');
        await win1.setUIContent('testability/pages/Index');
        await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        await win1.showWindow()
        await sleep(300)
        expect(count == 0).assertTrue()

        await win1.destroyWindow()
        await sleep(300)
        expect(count == 0).assertTrue()
        done()
      }catch (exception) {
        console.error(`Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code == 801) {
          done()
        } else {
          expect().assertFail()
          done()
        }
      }

    })

    /**
     * @tc.number    : SUB_BASIC_OFFWINDOWHIGHLIGHTCHANGE_0400
     * @tc.name      : test_OH_OffWindowHighlightChange_one
     * @tc.desc      : test_OH_OffWindowHighlightChange_one
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_OffWindowHighlightChange_one', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msg = 'test_OH_OffWindowHighlightChange_one '
      let count = 0
      let cb1 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb1, isBool = ' + isBool);
        if (isBool) {
          count++;
        }
      }
      let cb2 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb2, isBool = ' + isBool);
        if (isBool) {
          count++;
        }
      }
      try {
        windowClass.on('windowHighlightChange', cb1)
        windowClass.on('windowHighlightChange', cb2)

        windowClass.off('windowHighlightChange', cb1)
        let win1 = await windowStage.createSubWindow('win1');
        await win1.setUIContent('testability/pages/Index');
        await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        await win1.showWindow()
        await sleep(300)
        expect(count == 0).assertTrue()
        await win1.destroyWindow()
        await sleep(300)
        expect(count == 1).assertTrue()
        windowClass.off('windowHighlightChange')
        done()
      }catch (exception) {
        console.error(`Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code == 801) {
          done()
        } else {
          expect().assertFail()
          done()
        }
      }

    })

    /**
     * @tc.number    : SUB_BASIC_SETEXCLUSIVELYHIGHLIGHTED_0500
     * @tc.name      : test_OH_setExclusivelyHighlighted_one
     * @tc.desc      : test_OH_setExclusivelyHighlighted_one
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_OH_setExclusivelyHighlighted_one', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msg = 'test_OH_setExclusivelyHighlighted_one ';
      let support = true;
      let count = 0
      let cb1 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb1, isBool = ' + isBool);
        count++;
      }
      let cb2 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange cb2, isBool = ' + isBool);
        count++;
      }
      try {
        let options1 : window.SubWindowOptions = {
          title: 'title1',
          decorEnabled: true,
          isModal: false
        };
        let win1: window.Window
        let win = await windowStage.createSubWindowWithOptions('mySubWindow1', options1).catch((err: BusinessError) => {
          console.error(msg + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            support = false
          }
        });
        if (!support) {
          console.log(msg + 'device not support');
          done();
          return;
        }
        win1 = win as window.Window;
        await win1.setUIContent('testability/pages/Index');
        await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        let win2: window.Window
        win = await windowStage.createSubWindowWithOptions('mySubWindow2', options1).catch((err: BusinessError) => {
          console.error(msg + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        });
        win2 = win as window.Window;
        await win2.setUIContent('testability/pages/Index');
        await win2.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        win1.on('windowHighlightChange', cb1);
        win2.on('windowHighlightChange', cb2);
        await win1.setExclusivelyHighlighted(false);
        await win2.setExclusivelyHighlighted(false);

        await win1.showWindow();
        await sleep(500);
        console.log(msg + 'after showWindow1');
        expect(count == 1).assertTrue();

        await win2.showWindow();
        await sleep(500);
        console.log(msg + 'after showwindow2');
        expect(count == 2).assertTrue();

        await win1.raiseToAppTop();
        await sleep(500);
        expect(count == 2).assertTrue()
        await win2.raiseToAppTop();
        await sleep(500);
        expect(count == 2).assertTrue()

        await win1.setExclusivelyHighlighted(true);
        await win2.setExclusivelyHighlighted(true);
        await sleep(500);

        await win1.raiseToAppTop();
        await sleep(500);
        expect(count == 3).assertTrue();
        await win2.raiseToAppTop();
        await sleep(500);
        expect(count == 5).assertTrue();
        
        win1.destroyWindow();
        win2.destroyWindow();
        done();
      } catch (exception) {
        console.error(`Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code == 1300002 || exception.code == 801) {
          done()
          return
        } else {
          expect().assertFail()
          done()
        }
      }
    })


    })
}