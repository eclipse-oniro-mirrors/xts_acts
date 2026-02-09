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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
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
    let driver: Driver;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      windowClass = windowStage.getMainWindowSync();
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      let mainWindowId = windowClass.getWindowProperties().id;
      console.info(`beforeall mainWindowId: ${mainWindowId}`);
      let topWindow = await window.getLastWindow(context);
      let topWindowId = topWindow.getWindowProperties().id;
      console.info(`beforeall topWindowId: ${topWindowId}`);
      driver = Driver.create();
      try {
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.log('findComponent allowed: ' + JSON.stringify(allowed));
          if(allowed){
            await allowed.click();
          }
        } catch (err) {
          console.error('findComponent allowed failed: ' + JSON.stringify(err));
        }
    })
    afterEach(async ()=>{
      try {
        await sleep(1000)
        let mainWindowClass = windowStage.getMainWindowSync()
        let mainID = mainWindowClass.getWindowProperties().id
        let lastWindow = await window.getLastWindow(context)
        let lastID = lastWindow.getWindowProperties().id
        while (mainID != lastID) {
          await lastWindow.destroyWindow()
          await sleep(1000)
          lastWindow = await window.getLastWindow(context)
          lastID = lastWindow.getWindowProperties().id
      }
      } catch (error) {
        console.log('afterEach fail cause'+error)
      }
    })

    /**
     * @tc.name   test_OH_OnWindowHighlightChange_One
     * @tc.number SUB_BASIC_ONWINDOWHIGHLIGHTCHANGE_0100
     * @tc.desc   test_OH_OnWindowHighlightChange_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_OnWindowHighlightChange_One', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = 'test_OH_OnWindowHighlightChange_One ';
      let count = 0;
      let cb1 = (isBool: boolean) => {
        console.log(msg + 'windowHighlightChange, isBool = ' + isBool)
        if (isBool) {
          count++;
          console.log(msg + 'windowHighlightChange, count = ' + count);
        }
      }
      try {
        windowClass.on('windowHighlightChange', cb1)
        windowClass.on('windowHighlightChange', cb1)

        let win1 = await windowStage.createSubWindow('win1');
        await win1.setUIContent('testability/pages/Index');
        console.log(msg + 'getWindowLimits, minWidth = ' + win1.getWindowLimits().minWidth+' , minHeight:'+win1.getWindowLimits().minHeight);
        await win1.resize(win1.getWindowLimits().minWidth ?? 0 + 100, win1.getWindowLimits().minHeight ?? 0 + 100)

        await win1.showWindow()
        await sleep(500)
        console.log(msg + '1 count = ' + count);
        expect(count == 0).assertTrue()

        await win1.destroyWindow()
        await sleep(300)
        console.log(msg + '2 count = ' + count);
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
     * @tc.name   test_OH_OnWindowHighlightChange_Mul
     * @tc.number SUB_BASIC_ONWINDOWHIGHLIGHTCHANGE_0200
     * @tc.desc   test_OH_OnWindowHighlightChange_Mul
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   test_OH_OffWindowHighlightChange_clear_all
     * @tc.number SUB_BASIC_OFFWINDOWHIGHLIGHTCHANGE_0300
     * @tc.desc   test_OH_OffWindowHighlightChange_clear_all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_OH_OffWindowHighlightChange_one
     * @tc.number SUB_BASIC_OFFWINDOWHIGHLIGHTCHANGE_0400
     * @tc.desc   test_OH_OffWindowHighlightChange_one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   test_OH_setExclusivelyHighlighted_one
     * @tc.number SUB_BASIC_SETEXCLUSIVELYHIGHLIGHTED_0500
     * @tc.desc   test_OH_setExclusivelyHighlighted_one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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



    /**
     * @tc.name   test_ISWINDOWHIGHLIGHTED_0100
     * @tc.number SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0100
     * @tc.desc   test_ISWINDOWHIGHLIGHTED_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_ISWINDOWHIGHLIGHTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0100';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0100');
      try{
        windowClass.isWindowHighlighted();
        await windowClass.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   test_ISWINDOWHIGHLIGHTED_0200
     * @tc.number SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0200
     * @tc.desc   test_ISWINDOWHIGHLIGHTED_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_ISWINDOWHIGHLIGHTED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0200';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0200');
      await windowClass.destroyWindow();
      try{
        windowClass.isWindowHighlighted();
        expect().assertFail()
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        expect(err.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.name   test_ISWINDOWHIGHLIGHTED_0300
     * @tc.number SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0300
     * @tc.desc   test_ISWINDOWHIGHLIGHTED_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_ISWINDOWHIGHLIGHTED_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0300';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0300');
      try{
        await windowClass.setUIContent('testability/pages/First/index1');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass.showWindow();
        await sleep(300);
        let res = windowClass.isWindowHighlighted();
        await windowClass.destroyWindow();
        expect(res).assertEqual(true)
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   test_ISWINDOWHIGHLIGHTED_0400
     * @tc.number SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0400
     * @tc.desc   test_ISWINDOWHIGHLIGHTED_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_ISWINDOWHIGHLIGHTED_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0400';
      console.log(caseName + 'begin');
      let windowClass1 = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0400_1');
      let windowClass2 = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0400_2');
      try{
        await windowClass1.setUIContent('testability/pages/First/index1');
        await windowClass1.showWindow();
        await sleep(300);
        let res = windowClass1.isWindowHighlighted();
        expect(res).assertEqual(true)
        windowClass2.setExclusivelyHighlighted(false);
        await windowClass2.setUIContent('testability/pages/First/index1');
        await windowClass2.showWindow();
        await sleep(300);
        res = windowClass2.isWindowHighlighted();
        expect(res).assertEqual(true)
        await windowClass1.destroyWindow();
        await windowClass2.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass1.destroyWindow();
        await windowClass2.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });
    /**
     * @tc.name   test_ISWINDOWHIGHLIGHTED_0500
     * @tc.number SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0500
     * @tc.desc   test_ISWINDOWHIGHLIGHTED_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_ISWINDOWHIGHLIGHTED_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0500';
      console.log(caseName + 'begin');
      let highlightChange:boolean = false;
      let windowClass1 = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0500');
      try{
        windowClass1.on('windowHighlightChange', (data: boolean) => {
          console.info(caseName+` Window highlight Change: ${data}`);
          highlightChange = data;
        });
        await windowClass1.setUIContent('testability/pages/First/index1');
        await windowClass1.showWindow();
        await sleep(300);
        let res = windowClass1.isWindowHighlighted();
        expect(res).assertEqual(true)
        console.log(`${caseName} res:`+res+',highlightChange:'+highlightChange);
        expect(highlightChange).assertEqual(true);
        await windowClass1.minimize();
        await sleep(300);
        let res2 = windowClass1.isWindowHighlighted();
        console.log(`${caseName} res2:`+res2+',highlightChange:'+highlightChange);
        expect(res2).assertEqual(false)
        expect(highlightChange).assertEqual(false);
        windowClass1.off('windowHighlightChange')
        await windowClass1.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName}  fail1:`+err.code);
        await windowClass1.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   test_mainWindow_on_noInteractionDetected
     * @tc.number test_mainWindow_on_noInteractionDetected
     * @tc.desc   test_mainWindow_on_noInteractionDetected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_mainWindow_on_noInteractionDetected", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time: number;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 2, () => {
          console.info(msgStr + 'no interaction in 2s');
          time2 = new Date().getTime();
          time = time2 - time1;
          console.log(msgStr + ':time:' + time);
          expect(time).assertLess(3000);
          expect(time).assertLarger(1500);
          windowClass.off('noInteractionDetected');
          done();
        });
        time1 = new Date().getTime();
        await sleep(2000);
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })


    /**
     * @tc.name   test_mainWindow_off_noInteractionDetected
     * @tc.number test_mainWindow_off_noInteractionDetected
     * @tc.desc   test_mainWindow_off_noInteractionDetected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_mainWindow_off_noInteractionDetected", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "test_mainWindow_off_noInteractionDetected";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 2, () => {
          console.info(msgStr + 'no interaction in 2s');
          expect(false).assertTrue();
          done();
        });
        windowClass.off('noInteractionDetected');
        await sleep(3000);
       
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })


    /**
     * @tc.name   test_subWindow_on_noInteractionDetected
     * @tc.number test_subWindow_on_noInteractionDetected
     * @tc.desc   test_subWindow_on_noInteractionDetected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_subWindow_on_noInteractionDetected", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_subWindow_on_noInteractionDetected";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time: number;
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_subWindow_on_noInteractionDetected');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
          subWindowClass.on('noInteractionDetected', 2, () => {
            console.info(msgStr + 'no interaction in 2s');
            time2 = new Date().getTime();
            time = time2 - time1;
            console.log(msgStr + ':time:' + time);
            expect(time).assertLess(3000);
            expect(time).assertLarger(1500);
            subWindowClass.off('noInteractionDetected');
            subWindowClass.destroyWindow();
            done();
          });
          time1 = new Date().getTime();
          await sleep(2000);
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
           
            done();
          } else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_mainWindow_on_noInteractionDetected_two
     * @tc.number test_mainWindow_on_noInteractionDetected_two
     * @tc.desc   test_mainWindow_on_noInteractionDetected_two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_mainWindow_on_noInteractionDetected_two", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected_two";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time3: number;
      let Num: number = 0;
      const callback1 = () => {
        console.info(msgStr + 'no interaction callback1');
        time2 = new Date().getTime();
        let time = time2 - time1;
        console.log(msgStr + 'callback1:time:' + time);
        expect(time).assertLess(3000);
        expect(time).assertLarger(1500);
        Num++;
      };
      const callback2 = () => {
        console.info(msgStr + 'no interaction callback2');
        time3 = new Date().getTime();
        let time = time3 - time1;
        console.log(msgStr + 'callback2:time:' + time);
        expect(time).assertLess(4000);
        expect(time).assertLarger(2500);
        Num++;
      };
      try {
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('noInteractionDetected', 2, callback1);
        windowClass.on('noInteractionDetected', 3, callback2);
        time1 = new Date().getTime();
        await sleep(4000);
        console.log(msgStr + ':Num:' + Num);
        expect(Num).assertEqual(2);
        windowClass.off('noInteractionDetected');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_mainWindow_on_noInteractionDetected_One
     * @tc.number test_mainWindow_on_noInteractionDetected_One
     * @tc.desc   test_mainWindow_on_noInteractionDetected_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_mainWindow_on_noInteractionDetected_One", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected_One";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time3: number;
      let Num: number = 0;
      const callback1 = () => {
        console.info(msgStr + 'no interaction callback1');
        time2 = new Date().getTime();
        let time = time2 - time1;
        console.log(msgStr + 'callback1:time:' + time);
        expect(time).assertLess(3000);
        expect(time).assertLarger(1500);
        Num++;
      };
      const callback2 = () => {
        console.info(msgStr + 'no interaction callback2');
        time3 = new Date().getTime();
        let time = time3 - time1;
        console.log(msgStr + 'callback2:time:' + time);
        expect(time).assertLess(4000);
        expect(time).assertLarger(2500);
        Num++;
      };
      try {
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('noInteractionDetected', 2, callback1);
        windowClass.on('noInteractionDetected', 3, callback2);
        windowClass.off('noInteractionDetected', callback2);
        time1 = new Date().getTime();
        await sleep(3000);
        console.log(msgStr + ':Num:' + Num);
        expect(Num).assertEqual(1);
        windowClass.off('noInteractionDetected');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_mainWindow_on_noInteractionDetected_Two
     * @tc.number test_mainWindow_on_noInteractionDetected_Two
     * @tc.desc   test_mainWindow_on_noInteractionDetected_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_mainWindow_on_noInteractionDetected_Two", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected_Two";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time3: number;
      let Num: number = 0;
      const callback1 = () => {
        console.info(msgStr + 'no interaction callback1');
        time2 = new Date().getTime();
        let time = time2 - time1;
        console.log(msgStr + 'callback1:time:' + time);
        expect(time).assertLess(3000);
        expect(time).assertLarger(1500);
        Num++;
      };
      const callback2 = () => {
        console.info(msgStr + 'no interaction callback2');
        time3 = new Date().getTime();
        let time = time3 - time1;
        console.log(msgStr + 'callback2:time:' + time);
        expect(time).assertLess(4000);
        expect(time).assertLarger(2500);
        Num++;
      };
      try {
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('noInteractionDetected', 2, callback1);
        windowClass.on('noInteractionDetected', 3, callback2);
        windowClass.off('noInteractionDetected');
        time1 = new Date().getTime();
        await sleep(3000);
        console.log(msgStr + ':Num:' + Num);
        expect(Num).assertEqual(0);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name    test_mainWindow_on_noInteractionDetected_Not_triggered
     * @tc.number  test_mainWindow_on_noInteractionDetected_Not_triggered
     * @tc.desc    test_mainWindow_on_noInteractionDetected_Not_triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it(" test_mainWindow_on_noInteractionDetected_Not_triggered", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = " test_mainWindow_on_noInteractionDetected_Not_triggered";
      console.log(msgStr + "begin");
      let flag = false;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 2, () => {
          console.info(msgStr + 'no interaction in 2s');
          flag = true;
          expect(false).assertTrue();
          done();
        });
        await sleep(1000);
        await driver.click(800, 800);
        console.log(msgStr + ':flag:' + flag);
        expect(flag).assertEqual(false);
        windowClass.off('noInteractionDetected');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name    test_mainWindow_on_noInteractionDetected_0_5
     * @tc.number  test_mainWindow_on_noInteractionDetected_0_5
     * @tc.desc    test_mainWindow_on_noInteractionDetected_0_5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it(" test_mainWindow_on_noInteractionDetected_0_5", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = " test_mainWindow_on_noInteractionDetected_0.5";
      console.log(msgStr + "begin");
      let flag = false;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 0.5, () => {
          console.info(msgStr + 'no interaction in 2s');
          flag = true;
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else if (error.code == 401) {
          console.log(msgStr + '入参错误，不支持0.5');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name    test_mainWindow_on_noInteractionDetected__1
     * @tc.number  test_mainWindow_on_noInteractionDetected__1
     * @tc.desc    test_mainWindow_on_noInteractionDetected__1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it(" test_mainWindow_on_noInteractionDetected__1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = " test_mainWindow_on_noInteractionDetected_-1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', -1, () => {
          console.info(msgStr + 'no interaction in 2s');
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
         
          done();
        } else if (error.code == 401) {
          console.log(msgStr + '入参错误，不支持-1');
         
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   testOnwindowHighlightChange401
     * @tc.number SUB_BASIC_WMS_windowHighlightChange_401_0100
     * @tc.desc   testOnwindowHighlightChange401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnwindowHighlightChange401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnwindowHighlightChange401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.on(null, (data: boolean) => {
          console.info(`Window highlight Change: ${data}`);
        });
        console.log(msgStr  + 'Succeeded on windowHighlightChange ');
        expect(false).assertFail();
        done()
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }

    })

    /**
     * @tc.name   testoffwindowHighlightChange401
     * @tc.number SUB_BASIC_WMS_windowHighlightChange_401_0200
     * @tc.desc   testoffwindowHighlightChange401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testoffwindowHighlightChange401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testoffwindowHighlightChange401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.off(null)
        console.log(msgStr  + 'Succeeded on windowHighlightChange ');
        expect(false).assertFail();
        done()
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }

    })
    /**
     * @tc.name   testoffwindowHighlightChange1300002
     * @tc.number SUB_BASIC_WMS_windowHighlightChange_1300002_0300
     * @tc.desc   testoffwindowHighlightChange1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testoffwindowHighlightChange1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testoffwindowHighlightChange1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      const callback = (data: boolean) => {
      }
      try {
        let windowClass = await windowStage.createSubWindow('testoffwindowHighlightChange1300002');
        await windowClass.destroyWindow();
        windowClass.off('windowHighlightChange',callback);
        console.log(msgStr  + 'Succeeded on windowHighlightChange ');
        expect(false).assertFail();
        done()
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(1300002);
          done()
        }

      }

    })
    /**
     * @tc.name   testsetExclusivelyHighlighted401
     * @tc.number SUB_BASIC_WMS_setExclusivelyHighlighted_401_0100
     * @tc.desc   testsetExclusivelyHighlighted401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetExclusivelyHighlighted401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetExclusivelyHighlighted401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let promise = windowClass.setExclusivelyHighlighted(null);
        promise.then(() => {
          console.info('Succeeded in setting the window to be exclusively highlight.');
          expect(false).assertFail();
          done()
        }).catch((err: BusinessError) => {
          console.error(`Failed to set the window to be exclusively highlight. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertFail();
          done()
        });

      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }

    })

    /**
     * @tc.name   testsetExclusivelyHighlighted_1300004
     * @tc.number SUB_BASIC_WMS_setExclusivelyHighlighted_1300004_0200
     * @tc.desc   testsetExclusivelyHighlighted_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetExclusivelyHighlighted_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetExclusivelyHighlighted_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        let promise = windowClass.setExclusivelyHighlighted(true);
        promise.then(() => {
          console.info('Succeeded in setting the window to be exclusively highlight.');
          expect(false).assertFail();
          done()
        }).catch((err: BusinessError) => {
          console.error(`Failed to set the window to be exclusively highlight. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect(err.code).assertEqual(1300004);
            done()
          }
          
        });

      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(false).assertFail();
        done()
      }

    })
    /**
     * @tc.name   testsetExclusivelyHighlighted_1300002
     * @tc.number SUB_BASIC_WMS_setExclusivelyHighlighted_1300002_0300
     * @tc.desc   testsetExclusivelyHighlighted_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetExclusivelyHighlighted_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetExclusivelyHighlighted_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: ohosWindow.Configuration = {
        name: "test",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await ohosWindow.createWindow(config);
      try {
        await windowClass.destroyWindow();
        let promise = windowClass.setExclusivelyHighlighted(true);
        promise.then(() => {
          console.info('Succeeded in setting the window to be exclusively highlight.');
          expect(false).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`Failed to set the window to be exclusively highlight. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect(err.code).assertEqual(1300002);
            done()
          }
        });

      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(false).assertFail();
        done()
      }

    })
    
    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100 ';
      console.log(caseName + 'begin');
      let config: window.Configuration = {
        name: "test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0100",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      const subWindowClass = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the dialog window.`);
      try {
        let focusOnshowOptions: window.ShowWindowOptions = {
          focusOnShow: false
        }
        let promise =  subWindowClass.showWindow(focusOnshowOptions);
        promise.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
          expect().assertFail();
          await subWindowClass.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass.destroyWindow();
            done()
          } else {
            await subWindowClass.destroyWindow();
            expect(err.code).assertEqual(1300004)
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0200
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0200
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0200 ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0200')
      console.info(`${caseName} Succeeded in creating the dialog window.`);
      try {
        let promise =  subWindowClass.showWindow({focusOnShow: null});
        promise.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
          expect().assertFail();
          await subWindowClass.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass.destroyWindow();
            done()
          } else {
            await subWindowClass.destroyWindow();
            expect().assertFail();
            done()
          }
        });
      } catch (err) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(err.code).assertEqual(1300016)
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300 ';
      console.log(caseName + 'begin');
      let options : window.SubWindowOptions = {
        title: 'test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300',
        decorEnabled: true,
        isModal: true
      };
      let promise1 = windowStage.createSubWindowWithOptions('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0300', options);
      let subWindowClass: window.Window | undefined = undefined;
      promise1.then(async (data) => {
        subWindowClass = data;
        console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        await subWindowClass.setUIContent('testability/pages/First/index2');
        let focusOnshowOptions: window.ShowWindowOptions = {
          focusOnShow: undefined
        }
        await subWindowClass.showWindow(focusOnshowOptions);
        await sleep(100)
        await subWindowClass.destroyWindow()
        expect().assertFail();
        done();
      }).catch(async (err: BusinessError) => {
        console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (subWindowClass != undefined) {
          await subWindowClass.destroyWindow()
        }
        if (err.code === 1300002) {
          done()
        } else {
          expect(err.code).assertEqual(1300004)
          done();
        }
      });
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0400
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0400
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0400 ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_ERRORCODE_0400')
      console.info(`${caseName} Succeeded in creating the sub window.`);
      try {
        const callback = async (res: window.WindowEventType) => {
          console.log(`${caseName} subWindowClass WindowEventType: ${JSON.stringify(res)}`);
          console.info(`${caseName} subWindowClass isFocused: ${subWindowClass.isFocused()}`)
          if (res === 2 || res === 3) {
            expect(subWindowClass.isFocused()).assertEqual(true)
          } else {
            expect(subWindowClass.isFocused()).assertEqual(false)
          }
          await subWindowClass.destroyWindow();
          done()
        }
        subWindowClass.on('windowEvent', callback);
        let promise =  subWindowClass.showWindow({focusOnShow: undefined});
        promise.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass.destroyWindow();
            done()
          } else {
            await subWindowClass.destroyWindow();
            expect().assertFail();
            done()
          }
        });
      } catch (err) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_0100
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_0100
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_0100 ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_0100')
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      try {
        let focusOnshowOptions: window.ShowWindowOptions = {
          focusOnShow: false
        }
        let promise =  subWindowClass.showWindow(focusOnshowOptions);
        promise.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
          console.info(`${caseName} subWindowClass isFocused: ${subWindowClass.isFocused()}`)
          expect(subWindowClass.isFocused()).assertEqual(false)
          await subWindowClass.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass.destroyWindow();
            done()
          } else {
            await subWindowClass.destroyWindow();
            expect().assertFail();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_0200
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_0200
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_0200 ';
      console.log(caseName + 'begin');
      const subWindowClass = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_0200')
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      try {
        const callback = async (res: window.WindowEventType) => {
          console.log(`${caseName} subWindowClass WindowEventType: ${JSON.stringify(res)}`);
          console.info(`${caseName} subWindowClass isFocused: ${subWindowClass.isFocused()}`)
          if (res === 2 || res === 3) {
            expect(subWindowClass.isFocused()).assertEqual(true)
          } else {
            expect(subWindowClass.isFocused()).assertEqual(false)
          }
          await subWindowClass.destroyWindow();
          done()
        }
        subWindowClass.on('windowEvent', callback);
        let focusOnshowOptions: window.ShowWindowOptions = {
          focusOnShow: true
        }
        let promise =  subWindowClass.showWindow(focusOnshowOptions);
        promise.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass.destroyWindow();
            done()
          } else {
            await subWindowClass.destroyWindow();
            expect().assertFail();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_0300
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_0300
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_0300 ';
      console.log(caseName + 'begin');
      const subWindowClass1 = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_0300_1')
      console.info(`${caseName} Succeeded in creating the sub window 1.`);
      await subWindowClass1.setUIContent('testability/pages/First/index2');
      const subWindowClass2 = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_0300_2')
      console.info(`${caseName} Succeeded in creating the sub window 2.`);
      await subWindowClass1.setUIContent('testability/pages/First/index2');
      try {
        let focusOnshowOptions1: window.ShowWindowOptions = {
          focusOnShow: false
        }
        let promise1 =  subWindowClass1.showWindow(focusOnshowOptions1);
        promise1.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
          console.info(`${caseName} subWindowClass1 isFocused: ${subWindowClass1.isFocused()}`)
          expect(subWindowClass1.isFocused()).assertEqual(false);
          let focusOnshowOptions2: window.ShowWindowOptions = {
            focusOnShow: true
          }
          let promise2 =  subWindowClass2.showWindow(focusOnshowOptions2);
          promise2.then(async () => {
            console.info(caseName + 'Succeeded in showWindow.');
            await sleep(500);
            console.info(`${caseName} subWindowClass2 isFocused: ${subWindowClass2.isFocused()}`)
            expect(subWindowClass2.isFocused()).assertEqual(true);
            await subWindowClass1.raiseToAppTop();
            await sleep(300);
            console.info(`${caseName} after raiseTopAppTop, subWindowClass1 isFocused: ${subWindowClass1.isFocused()}`)
            expect(subWindowClass1.isFocused()).assertEqual(true);
            await subWindowClass1.destroyWindow();
            await subWindowClass2.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 801) {
              await subWindowClass2.destroyWindow();
              await subWindowClass1.destroyWindow();
              done()
            } else {
              await subWindowClass2.destroyWindow();
              await subWindowClass1.destroyWindow();
              expect().assertFail();
              done()
            }
          });
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass1.destroyWindow();
            await subWindowClass2.destroyWindow();
            done()
          } else {
            await subWindowClass1.destroyWindow();
            await subWindowClass2.destroyWindow();
            expect().assertFail();
            done()
          }
        });

      } catch (e) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
        await subWindowClass1.destroyWindow();
        await subWindowClass2.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_0400
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_0400
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_0400 ';
      console.log(caseName + 'begin');
      const subWindowClass1 = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_0400_1')
      console.info(`${caseName} Succeeded in creating the sub window 1.`);
      await subWindowClass1.setUIContent('testability/pages/First/index2');
      const subWindowClass2 = await windowStage.createSubWindow('test_SHOWWINDOW_FOCUSONSHOW_0400_2')
      console.info(`${caseName} Succeeded in creating the sub window 2.`);
      await subWindowClass1.setUIContent('testability/pages/First/index2');
      try {
        let focusOnshowOptions1: window.ShowWindowOptions = {
          focusOnShow: false
        }
        let focusOnshowOptions2: window.ShowWindowOptions = {
          focusOnShow: true
        }
        let promise1 =  subWindowClass1.showWindow(focusOnshowOptions1);
        promise1.then(async () => {
          console.info(caseName + 'Succeeded in showWindow.');
          console.info(`${caseName} subWindowClass1 isFocused: ${subWindowClass1.isFocused()}`)
          expect(subWindowClass1.isFocused()).assertEqual(false);

          let promise2 =  subWindowClass2.showWindow(focusOnshowOptions2);
          promise2.then(async () => {
            console.info(caseName + 'Succeeded in showWindow.');
            await sleep(500);
            console.info(`${caseName} subWindowClass2 isFocused: ${subWindowClass2.isFocused()}`)
            expect(subWindowClass2.isFocused()).assertEqual(true);
            await subWindowClass2.destroyWindow();
            console.info(`${caseName} after subWindowClass2.destroyWindow(), subWindowClass1 isFocused: ${subWindowClass1.isFocused()}`)
            expect(subWindowClass1.isFocused()).assertEqual(true);
            await subWindowClass1.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 801) {
              await subWindowClass2.destroyWindow();
              await subWindowClass1.destroyWindow();
              done()
            } else {
              await subWindowClass2.destroyWindow();
              await subWindowClass1.destroyWindow();
              expect().assertFail();
              done()
            }
          });
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            await subWindowClass1.destroyWindow();
            await subWindowClass2.destroyWindow();
            done()
          } else {
            await subWindowClass1.destroyWindow();
            await subWindowClass2.destroyWindow();
            expect().assertFail();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
        await subWindowClass1.destroyWindow();
        await subWindowClass2.destroyWindow();
        expect().assertFail();
        done()
      }
    });

    /**
     * @tc.name   test_SHOWWINDOW_FOCUSONSHOW_0500
     * @tc.number SUB_BASIC_WMS_SHOWWINDOW_FOCUSONSHOW_0500
     * @tc.desc   test_SHOWWINDOW_FOCUSONSHOW_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SHOWWINDOW_FOCUSONSHOW_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SHOWWINDOW_FOCUSONSHOW_0500 ';
      console.log(caseName + 'begin');
      let config: window.Configuration = {
        name: "test_SHOWWINDOW_FOCUSONSHOW_0500",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} Succeeded in creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await sleep(1000);
          let focusOnshowOptions: window.ShowWindowOptions = {
            focusOnShow: true
          }
          let promise =  subWindowClass.showWindow(focusOnshowOptions);
          promise.then(async () => {
            await sleep(300);
            console.info(caseName + 'Succeeded in showWindow.');
            console.info(`${caseName} subWindowClass isFocused: ${subWindowClass?.isFocused()}`)
            expect(subWindowClass?.isFocused()).assertEqual(true);
            await subWindowClass?.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 801) {
              await subWindowClass?.destroyWindow();
              done()
            } else {
              expect().assertFail();
              await subWindowClass?.destroyWindow();
              done()
            }
          });
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed in showWindow. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 1300002) {
            await subWindowClass?.destroyWindow();
            done()
          } else {
            expect().assertFail();
            await subWindowClass?.destroyWindow();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2 in showWindow. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testWindowHighlightChange_Order_0100
     * @tc.number SUB_BASIC_WMS_ACTIVE_ORDER_0100
     * @tc.desc   焦点切换激活态通知保序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindowHighlightChange_Order_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindowHighlightChange_Order_0100 ';
      console.log(caseName + 'begin');
      let a = 0;
      let subWindowClass: undefined | window.Window;
      let subWindowClass2: undefined | window.Window;
      try {
        subWindowClass = await windowStage.createSubWindow('testWindowHighlightChange_Order_0100_1');
        console.error(`${caseName} Succeeded in creating the sub window.`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow();
        await sleep(300);
        console.info(`${caseName} subWindowClass1 show`);
        let callback1 = (res: Boolean) => {
          console.info(`${caseName} callback1 res: ${res}`);
          if(res == false){
            a = a+1;
            console.info(`${caseName} callback1 a : ${a}`);
          }
        }
        subWindowClass.on('windowHighlightChange', callback1);
        subWindowClass2 = await windowStage.createSubWindow('testWindowHighlightChange_Order_0100_2');
        let callback2 = async (res: Boolean) => {
          console.info(`${caseName} callback2 res: ${res}`);
          if(res == true){
            a = a-1;
            console.info(`${caseName} callback2 a : ${a}`);
          }

        }
        subWindowClass2.on('windowHighlightChange', callback2);
        await subWindowClass2.setUIContent('testability/pages/First/index2');
        await subWindowClass2.showWindow()
        await sleep(300);
        console.info(`${caseName} subWindowClass2 show`);
        console.info(`${caseName} a (1) : ${a}`);
        expect(a).assertEqual(0);
        await subWindowClass.raiseToAppTop();
        console.info(`${caseName} subWindowClass1 show`);
        await sleep(300);

        await subWindowClass2.raiseToAppTop();
        console.info(`${caseName} subWindowClass2 show`);
        await sleep(300);

        console.info(`${caseName} a (2) : ${a}`);
        expect(a).assertEqual(0);
        await subWindowClass?.destroyWindow();
        await subWindowClass2?.destroyWindow();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await subWindowClass?.destroyWindow();
        await subWindowClass2?.destroyWindow();
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });


  })
}