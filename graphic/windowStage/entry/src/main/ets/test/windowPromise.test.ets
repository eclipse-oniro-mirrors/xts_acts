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

export default function windowPromiseTest(context, windowStage, abilityStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowPromise_test', function () {
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
      'TYPE_SYSTEM_ALERT': 1,
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
    beforeEach(function () {
    })
    afterEach(async function (done) {
      windowCount++;
      console.log('promise jsunittest afterEach listenerData:' + JSON.stringify(listenerData));
      if (listenerData.on) {
        listenerData.on = false;
        console.log('jsunittest afterEach listener off, listenerData:' + JSON.stringify(listenerData));
        if (listenerData.typeStr === 'systemBarTintChange') {
          ohosWindow.off(listenerData.typeStr);
        } else if (newWindowObj) {
          newWindowObj.off(listenerData.typeStr);
        }
        await sleep(3000);
      }
      done();
    })
    afterAll(function () {
    })

    function expectedError(error, caseName, apiName, done, code) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      if (error.code === code) {
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
	 * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_001
	 * @tc.name       Test listenerTest1
	 * @tc.desc       Verify whether the change monitoring of avoidance area can be started normally.
	 */
    it('listenerTest1', 0, async function (done) {
      let caseName = 'listenerTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOnFlag = false;
      console.log(msgStr + 'begin');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      listenerData.on = true;
      listenerData.typeStr = 'systemAvoidAreaChange';

      tempWnd.on('systemAvoidAreaChange', (avoidAreaData) => {
        console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, avoidAreaData : ' + JSON.stringify(avoidAreaData));
        console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, listenerOnFlag : ' + JSON.stringify(listenerOnFlag));
        if (listenerOnFlag) {
          expect(!!avoidAreaData).assertTrue();
          tempWnd.off('systemAvoidAreaChange');
          done();
        }
      })
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      listenerOnFlag = true;
      await sleep(1000);
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
    })

    /**
	 * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_002
	 * @tc.name       Test listenerTest2
	 * @tc.desc       Verify that the window size avoidance area changes and monitor whether it can be opened normally.
	 */
    it('listenerTest2', 0, async function (done) {
      let caseName = 'listenerTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wndId = 'listenerTest2';
      let baseType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
      let changedModel = 102;
      let baseValue = 100;
      let resizeValue = 200;
      let listenerOnFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      let tempWnd = null;
      listenerData.on = true;
      listenerData.typeStr = 'windowSizeChange';
      try {
        await ohosWindow.create(context, wndId, baseType).then((data) => {
          tempWnd = data
          newWindowObj = tempWnd
          console.log(msgStr + 'ohosWindow.create data:' + JSON.stringify(data));
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
        });
        console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        listenerData.on = true;
        listenerData.typeStr = 'windowSizeChange';
      } catch (err) {
        console.log(msgStr + 'ohosWindow.create catch err:' + JSON.stringify(err));
      }
      await tempWnd.on('windowSizeChange', (sizeData) => {
        console.log(msgStr + 'tempWnd.on windowSizeChange, systemBatData : ' + JSON.stringify(sizeData));
        if (listenerOnFlag === listenerStatus.pending) {
          listenerOnFlag = listenerStatus.finished;
          expect(!!sizeData).assertTrue();
          expect(sizeData.width === resizeValue).assertTrue();
          expect(sizeData.height === resizeValue).assertTrue();
        }
      })
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setWindowMode(changedModel).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setWindowMode ' + changedModel, done);
      });
      console.log(msgStr + 'tempWnd.setWindowMode ' + changedModel + ' success');
      await tempWnd.resetSize(baseValue, baseValue).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize(' + baseValue + ', ' + baseValue + ')', done);
      });
      console.log(msgStr + 'tempWnd.resetSize(' + baseValue + ', ' + baseValue + ') success');
      console.log(msgStr + 'tempWnd.on windowSizeChange finished');
      await sleep(1000);
      listenerOnFlag = listenerStatus.pending;
      await tempWnd.resetSize(resizeValue, resizeValue).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize(' + resizeValue + ', ' + resizeValue + ')', done);
      });
      await tempWnd.destroy();
      done();
      console.log(msgStr + 'tempWnd.resetSize(' + resizeValue + ', ' + resizeValue + ') success');
    })
    /**
    * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_003
    * @tc.name       Test listenerTest3
    * @tc.desc       Verify whether the change monitoring of avoidance area can be started normally.
    */
    it('listenerTest3', 0, async function (done) {
      let caseName = 'listenerTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOffFlag = listenerStatus.ready;
      console.log(msgStr + 'begin 1');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      listenerData.on = true;
      listenerData.typeStr = 'systemAvoidAreaChange';
      tempWnd.on('systemAvoidAreaChange', (avoidAreaData) => {
        console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, systemBatData : ' + JSON.stringify(avoidAreaData));
        console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, systemBatData 1100 : ' + JSON.stringify(avoidAreaData));
        done();
      })
      console.log(msgStr + 'tempWnd.on systemAvoidAreaChange finished');
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await sleep(1000);
      tempWnd.off('systemAvoidAreaChange');
      console.log(msgStr + 'tempWnd.off systemAvoidAreaChange finished');
      await sleep(10010);
      listenerOffFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
    })
    /**
   * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_004
   * @tc.name       Test listenerTest4
   * @tc.desc       Verify whether the window size change monitoring can be closed normally.
   */
    it('listenerTest4', 0, async function (done) {
      let caseName = 'listenerTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wndId = 'listenerTest4';
      let baseType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
      let changedModel = 102;
      let listenerOffFlag = false;
      listenerData.on = true;
      listenerData.typeStr = 'windowSizeChange';
      console.log(msgStr + 'begin');
      let createWindowObj = {
        name: wndId, windowType: baseType, ctx: context
      }
      console.log(msgStr + 'ohosWindow.create createWindowObj:' + JSON.stringify(createWindowObj));
      let tempWnd = null;
      await ohosWindow.create(context, wndId, baseType).then((data) => {
        console.log(msgStr + 'ohosWindow.create data:' + JSON.stringify(data));
        tempWnd = data
        newWindowObj = data
        console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
      }).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
      });

      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setWindowMode(changedModel).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setWindowMode ' + changedModel, done);
      });
      console.log(msgStr + 'tempWnd.setWindowMode ' + changedModel + ' success');
      await sleep(1000);
      await tempWnd.on('windowSizeChange', (sizeData) => {
        console.log(msgStr + 'tempWnd.on windowSizeChange, sizeData : ' + JSON.stringify(sizeData));
        if (listenerOffFlag) {
          listenerOffFlag = false;
          console.log(msgStr + 'tempWnd.on windowSizeChange  sizeData: ' + JSON.stringify(sizeData));
          expect(sizeData.width === 100).assertTrue();
          expect(sizeData.height === 100).assertTrue();
          done();
        } else {
          console.log(msgStr + 'tempWnd.on windowSizeChange,else listenerOffFlag : ' + listenerOffFlag);
          console.log(msgStr + 'tempWnd.on windowSizeChange,else sizeData : ' + JSON.stringify(sizeData));
          if(sizeData.width === 100&&sizeData.height === 100){
            console.log(msgStr + 'tempWnd.on windowSizeChange,else sizeData.width === 100&&sizeData.height === 100');
            done();
          }
        }
      })
      console.log(msgStr + 'tempWnd.on windowSizeChange finished');
      await tempWnd.resetSize(100, 100).then(() => {
        listenerOffFlag = true;
        console.log(msgStr + 'listenerOffFlag:' + listenerOffFlag);
      }).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize(100, 100)', done);
      });
      console.log(msgStr + 'tempWnd.resetSize(100, 100) success');
      console.log(msgStr + 'tempWnd.off windowSizeChange finished');
      await tempWnd.destroy();
      done();
      console.log(msgStr + 'finished');
    })
    /**
    * @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_001
    * @tc.name       Test setWindowTypeTest1
    * @tc.desc       Test window.setWindowType API function test.
    */
    it('setWindowTypeTest1', 0, async function (done) {
      let caseName = 'setWindowTypeTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'setWindowTypeTest1';
      console.log(msgStr + 'begin');
      let tempWnd = null
      let tempTypeArr = [];
      tempWnd = await ohosWindow.create(context, windowId, baseWndType).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.create', done);
      })
      console.log(msgStr + 'ohosWindow.create ' + baseWndType + '   ,tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      let loopCount1 = systemWindowTypeArr;
      console.log(msgStr + 'ohosWindow.windowType' + JSON.stringify(loopCount1))
      for (let i = 1; i < loopCount1.length; i++) {
        let tempType = ohosWindow.WindowType[loopCount1[i]];
        console.log(msgStr + 'tempWnd.setWindowType: ' + tempType + ' ,start');
        tempTypeArr.push(tempType);
        console.log(msgStr + 'tempTypeArr: ' + JSON.stringify(tempTypeArr));
        let windowTypeData = await tempWnd.setWindowType(tempType).catch((err) => {
          console.log(msgStr + 'tempWnd.setWindowType err' + JSON.stringify(err));
        })
        console.log(msgStr + 'tempWnd.setWindowType windowTypeData' + JSON.stringify(windowTypeData));
        console.log(msgStr + 'tempWnd.setWindowType !windowTypeData' + !windowTypeData);
        console.log(msgStr + 'tempWnd.setWindowType ' + tempType + ' end');
        if (!windowTypeData) {
          expect(!windowTypeData).assertTrue();
          let prodata = await tempWnd.getProperties().catch((err) => {
            console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
            unexpectedError(err, caseName, 'tempWnd.getProperties', done);
          })
          console.log(msgStr + 'tempWnd.getProperties prodata' + JSON.stringify(prodata));
          console.log(msgStr + 'tempWnd.getProperties !!prodata' + !!prodata);
          expect(!!prodata).assertTrue();
          if (!!prodata) {
            tempTypeArr.splice(tempTypeArr.findIndex(item => item === prodata.type), 1);
            console.log(msgStr + '(loopCount1.length - i): ' + (loopCount1.length - i));
            console.log(msgStr + '(tempTypeArr.length + 1): ' + (tempTypeArr.length + 1));
            if (i == loopCount1.length - 1) {
              expect((loopCount1.length - i) == (tempTypeArr.length + 1)).assertTrue();
              console.log(msgStr + 'tempWnd.getProperties i=' + i + '   ,    loopCount1.length-1==' + loopCount1.length);
              await tempWnd.destroy();
              done();
            }
          }
        }
      }
    })
    /**
    * @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_002
    * @tc.name       Test setWindowTypeTest2
    * @tc.desc       Test window.setWindowType API function test.
    */
    it('setWindowTypeTest2', 0, async function (done) {
      let caseName = 'setWindowTypeTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let changedWndType = null;
      let windowId = 'setWindowTypeTest2';
      console.log(msgStr + 'begin');
      let tempWnd = null
      await ohosWindow.create(context, windowId, baseWndType).then(
        (data) => {
          tempWnd = data
        }
      ).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.create', done);
      })
      console.log(msgStr + 'ohosWindow.create tempWnd' + JSON.stringify(tempWnd));
      console.log(msgStr + 'ohosWindow.create !!tempWnd' + !!tempWnd);
      if (!!tempWnd) {
        expect(!!tempWnd).assertTrue();
        await tempWnd.setWindowType(changedWndType).then(() => {
        }).catch((err) => {
          console.log(msgStr + 'tempWnd.setWindowType err.code: ' + JSON.stringify(err.code));
          tempWnd.destroy();
          let flag = (err.code == 1003)
          console.log(msgStr + 'tempWnd.setWindowType flag: ' + flag);
          if (flag) {
            expect(true).assertTrue();
          }
          done();
        })
      }
    })
    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_001
	  * @tc.name       Test setSystemBarEnableTest1
	  * @tc.desc       Verify that the scene shows the status bar and hides the navigation bar
	  */
    it('setSystemBarEnableTest1', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');

      await tempWnd.setSystemBarEnable(['navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['status']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
    })
    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_002
	  * @tc.name       Test setSystemBarEnableTest2
	  * @tc.desc       Verify that the scene hides the status bar and displays the navigation bar
	  */
    it('setSystemBarEnableTest2', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_003
	  * @tc.name       Test setSystemBarEnableTest3
	  * @tc.desc       Verify that the scene displays both the status bar and the navigation bar
	  */
    it('setSystemBarEnableTest3', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success .');
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_004
	  * @tc.name       Test setSystemBarEnableTest4
	  * @tc.desc       Verify that the scene hides both the status bar and the navigation bar
	  */
    it('setSystemBarEnableTest4', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_005
	  * @tc.name       Test setSystemBarEnableTest5
	  * @tc.desc       Verify the scene where illegal values are entered when the status bar and navigation bar are displayed
	  */
    it('setSystemBarEnableTest5', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + JSON.stringify(tempWnd));
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
        console.log(msgStr + 'tempWnd.setFullScreen(true) err' + JSON.stringify(err));
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await tempWnd.setSystemBarEnable([null, '123']).catch((err) => {
        console.log(msgStr + 'tempWnd.setSystemBarEnable([null, 123]) err=' + JSON.stringify(err));
        expect(err.code === 1003).assertTrue();
        done();
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([null, 123]) finished');
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_001
	  * @tc.name       Test setSystemBarPropertiesTest1
	  * @tc.desc       Verify the scene where the colors of the status bar and navigation bar are set in RGB
	  */
    it('setSystemBarPropertiesTest1', 0, async function (done) {
      let caseName = 'setSystemBarPropertiesTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonRGBColorArr));
      let compareCount = 0;
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR || tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
              expect(backgroundIndex === -1).assertTrue();
              expect(contentColorIndex === -1).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      listenerFlag = listenerStatus.pending;
      let loopCount = commonRGBColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonRGBColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationContentColor: tempColor,
        };
        await tempWnd.setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
        })
      }
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_002
	  * @tc.name       Test setSystemBarPropertiesTest2
	  * @tc.desc       Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
	  */
    it('setSystemBarPropertiesTest2', 0, async function (done) {
      let caseName = 'setSystemBarPropertiesTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = {
        SBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        SCC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NCC: JSON.parse(JSON.stringify(commonNUMBERColorArr))
      };
      let compareCount = 0;
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.SBC.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.SCC.indexOf(tempData.contentColor);
              if (backgroundIndex >= 0) {
                cloneColorArr.SBC.splice(backgroundIndex, 1);
              }
              if (contentColorIndex >= 0) {
                cloneColorArr.SCC.splice(contentColorIndex, 1);
              }
              expect(backgroundIndex !== -1).assertTrue();
              expect(contentColorIndex !== -1).assertTrue();
            } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.NBC.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.NCC.indexOf(tempData.contentColor);
              if (backgroundIndex >= 0) {
                cloneColorArr.NBC.splice(backgroundIndex, 1);
              }
              if (contentColorIndex >= 0) {
                cloneColorArr.NCC.splice(contentColorIndex, 1);
              }
              expect(backgroundIndex !== -1).assertTrue();
              expect(contentColorIndex !== -1).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      listenerFlag = listenerStatus.pending;
      let loopCount = commonNUMBERColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonNUMBERColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: true,
          navigationBarContentColor: tempColor,
        };
        await tempWnd.setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
        })
      }
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_003
	  * @tc.name       Test setSystemBarPropertiesTest3
	  * @tc.desc       Verify the scene where the status bar and navigation bar colors are set as keywords
	  */
    it('setSystemBarPropertiesTest3', 0, async function (done) {
      let caseName = 'setSystemBarPropertiesTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonKEYColorArr));
      let compareCount = 0;
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', async (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'i=' + i + '   , ohosWindow.on for=' + JSON.stringify(tempData));
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR || tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
              expect(backgroundIndex === -1).assertTrue();
              expect(contentColorIndex === -1).assertTrue();
            }
          }
        }
        done();
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      listenerFlag = listenerStatus.pending;
      let loopCount = commonKEYColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonKEYColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationContentColor: tempColor,
        };
        await tempWnd.setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
          done();
        })
      }
    })

    /**
	 * @tc.number     SUB_WINDOW_CREATE_JSAPI_001
	 * @tc.name       Test create
	 * @tc.desc       Verify the scenario of creating the application type window
	 */
    it('createTest1', 0, async function (done) {
      let caseName = 'createTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeDicArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      for (let i = 0; i < loopCount; i++) {
        let tempType = systemWindowTypeDic[systemWindowTypeDicArr[i]];
        let windId = 'createTest1' + i;
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
        let tempWnd = null
        await ohosWindow.create(context, windId, tempType).then(
          (data) => {
            tempWnd = data;
          }
        ).catch((err) => {
          console.log(msgStr + 'ohosWindow.create ' + tempType + 'catched, err: ' + JSON.stringify(err));
          unexpectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
        });
        console.log(msgStr + 'ohosWindow.create ' + tempType + 'finished, wnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroy();
      }
      console.log(msgStr + 'done ');
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_CREATE_JSAPI_002
    * @tc.name       Test createTest2
    * @tc.desc       Verify the scenario of creating the system type window
    */
    it('createTest2', 0, async function (done) {
      let caseName = 'createTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log(msgStr + ' loopCount: ' + loopCount);
      let n = 0
      for (let i = 0; i < loopCount; i++) {
        let tempType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
        let windId = 'createTest2' + i;
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
        let createData = null;
        try {
          await ohosWindow.create(context, windId, tempType).then((data) => {
            createData = data
            expect(!!createData).assertTrue();
          }).catch((err) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            unexpectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
            return;
          })
        }
        catch (err) {
          console.log(msgStr + 'ohosWindow.create catch err' + JSON.stringify(err));
        }
        let tempWnd = createData
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' wnd: ' + tempWnd);
        let proData = await tempWnd.getProperties().catch((err) => {
          console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
          unexpectedError(err, caseName, 'tempWnd.getProperties', done);
          console.log(msgStr + 'tempWnd.getProperties err&&err.code' + JSON.stringify(err));
        })
        expect(!!proData).assertTrue();
        expect(proData.type == tempType).assertTrue();
        await createData.destroy();
        console.log(msgStr + 'n：' + n);
        if (proData.type == tempType) n++
        console.log(msgStr + 'n++：' + n);
        console.log(msgStr + 'i：' + i);
        if (i + 1 == loopCount) {
          if (n === loopCount) {
            expect(true).assertTrue();
          } else {
            expect(true).assertFail();
          }
        }
      }
      done();
    })
    /**
	 * @tc.number     SUB_WINDOW_CREATE_JSAPI_003
	 * @tc.name       Test createTest3
	 * @tc.desc       Verify the scenario of creating a window of a type that does not exist
	 */
    it('createTest3', 0, async function (done) {
      let caseName = 'createTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'nonExistWindowType';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
      let nonExistWnd = await ohosWindow.create(context, windId, tempType).catch((err) => {
        console.log(msgStr + 'ohosWindow.create err: ' + JSON.stringify(err));
        expect(err.code === 1003).assertTrue();
        done();
      });
    })
    /**
    * @tc.number     SUB_WINDOW_CREATE_JSAPI_004
    * @tc.name       Test createTest4
    * @tc.desc       Verify the scenario of creating a window with duplicate IDs
    */
    it('createTest4', 0, async function (done) {
      let caseName = 'createTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameids'
      let ohosData = null;
      await ohosWindow.create(context, windowId, 1).then(
        (data) => {
          ohosData = data;
        }).catch((err) => {
        console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
        unexpectedError(err, caseName, 'ohosWindow.create', done);
      })
      expect(!!ohosData).assertTrue();
      let ohosDataError = await ohosWindow.create(context, windowId, 1).catch((err) => {
        console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001)
        done();
      })
      await ohosData.destroy();
      console.log(msgStr + 'ohosWindow.create 1 twice ohosDataError: ' + JSON.stringify(ohosDataError));
    })
    /**
    * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_001
    * @tc.name       Test loadContentTest1
    * @tc.desc       Verify the scenario of loading an existing page
    */
    it('loadContentTest1', 0, async function (done) {
      let caseName = 'loadContentTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest1';
      console.log(msgStr + 'begin');
      let createWindowObj = {
        name: windowId, windowType: baseWndType, ctx: context
      }
      let tempWnd = null;
      try {
        await ohosWindow.createWindow(createWindowObj).then((data) => {
          tempWnd = data
          console.log(msgStr + 'ohosWindow.create ' + baseWndType + '  , wnd: ' + tempWnd);
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        });
      } catch (err) {
        console.log(msgStr + 'ohosWindow.create catch err:' + JSON.stringify(err));
      }
      expect(!!tempWnd).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent start');
      let load = await tempWnd.loadContent('pages/second/second').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.loadContent', done);
        console.log(msgStr + 'tempWnd.loadContent(pages/second/second) err=' + JSON.stringify(err));
      });
      console.log(msgStr + 'tempWnd.loadContent(pages/second/second) load=' + JSON.stringify(load));
      expect(!load).assertTrue();
      await tempWnd.destroy();
      done();
    })

    /**
    * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_002
    * @tc.name       Test loadContentTest2
    * @tc.desc       Verify the scene of loading the page with illegal values
    */
    it('loadContentTest2', 0, async function (done) {
      let caseName = 'loadContentTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest2';
      console.log(msgStr + 'begin');
      let createWindowObj = {
        name: windowId, windowType: baseWndType, ctx: context
      }
      let tempWnd = null;
      try {
        await ohosWindow.createWindow(createWindowObj).then((data) => {
          tempWnd = data
          console.log(msgStr + 'ohosWindow.create ' + baseWndType + ' wnd: ' + tempWnd);
          expect(!!tempWnd).assertTrue();
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        });
      }
      catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow catch err:' + JSON.stringify(err));
      }
      console.log(msgStr + 'tempWnd.loadContent start');
      await tempWnd.destroy();
      let errFlag = false;
      let loadContentData = null;
      try {
        await tempWnd.loadContent(null).then((data) => {
          loadContentData = data;
        }).catch((err) => {
          errFlag = true;
          expectedError(err, caseName, 'tempWnd.loadContent', done, 1003);
          console.log(msgStr + 'tempWnd.loadContent(null)' + JSON.stringify(err));
        });
        console.log(msgStr + 'tempWnd.loadContent loadContentData:' + JSON.stringify(loadContentData));
        if (!errFlag) {
          console.log(msgStr + 'should report err');
          expect(TRUE_FLAG).assertFail();
          done();
        }
      } catch (err) {
        console.log(msgStr + 'tempWnd.loadContent(null) catch err:' + JSON.stringify(err));
      }
    })

    /**
    * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_003
    * @tc.name       Test loadContentTest3
    * @tc.desc       Verify the scenario of loading an existing page
    */
    it('loadContentTest3', 0, async function (done) {
      let caseName = 'loadContentTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load3 = await windowStage.loadContent('MainAbility/pages/second/second').catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
        console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
      });
      expect(!load3).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent end load=' + JSON.stringify(load3));
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_004
    * @tc.name       Test loadContentTest4
    * @tc.desc       Verify the scenario of loading an existing page
    */
    it('loadContentTest4', 0, async function (done) {
      let caseName = 'loadContentTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load4 = await windowStage.loadContent(null).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent(null)' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load5=' + JSON.stringify(load4));
      }
      catch (err) {
        console.log(msgStr + 'tempWnd.loadContent catch err=' + JSON.stringify(err));
        expectedError(err.code, caseName, 'tempWnd.loadContent', done, 401);
      }
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_005
    * @tc.name       Test loadContentTest5
    * @tc.desc       Verify the scenario of loading an existing page
    */
    it('loadContentTest5', 0, async function (done) {
      let caseName = 'loadContentTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load5 = await windowStage.loadContent(null, abilityStorage).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent(null)' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load5=' + JSON.stringify(load5));
      }
      catch (err) {
        console.log(msgStr + 'tempWnd.loadContent catch err=' + JSON.stringify(err));
        expectedError(err.code, caseName, 'tempWnd.loadContent', done, 401);
      }
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_006
    * @tc.name       Test loadContentTest6
    * @tc.desc       Verify the scenario of loading an existing page
    */
    it('loadContentTest6', 0, async function (done) {
      let caseName = 'loadContentTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load6 = await windowStage.loadContent('MainAbility/pages/second/second', null).catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
        console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
      });
      expect(!load6).assertTrue();
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_001
    * @tc.name       Test createSubWindowTest1
    * @tc.desc       Verify the scenario of creating an auxiliary window
    */
    it('createSubWindowTest1', 0, async function (done) {
      let caseName = 'createSubWindowTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = await windowStage.createSubWindow('createSubWindowTest1').catch((err) => {
        unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
        console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest1)=' + JSON.stringify(err));
      });
      expect(!!subWindow).assertTrue();
      await subWindow.destroy();
      console.log(msgStr + 'windowStage.createSubWindow end subWindow=' + JSON.stringify(subWindow));
      console.log(msgStr + 'windowStage.createSubWindow end !!subWindow=' + !!subWindow);
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_002
    * @tc.name       Test createSubWindowTest2
    * @tc.desc       Verify the scene of entering illegal values to create an auxiliary window
    */
    it('createSubWindowTest2', 0, async function (done) {
      let caseName = 'createSubWindowTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let subWindow = await windowStage.createSubWindow(null).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage.createSubWindow end subWindow=' + JSON.stringify(subWindow));
      }
      catch (err) {
        expectedError(err.code, caseName, 'windowStage.createSubWindow', done, 401);
        console.log(msgStr + 'windowStage.createSubWindow catch err=' + JSON.stringify(err));
      }
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_GETSUBWINDOW_JSAPI_001
    * @tc.name       Test getSubWindowTest1
    * @tc.desc       Verify the scene of obtaining all auxiliary sub windows
    */
    it('getSubWindowTest1', 0, async function (done) {
      let caseName = 'getSubWindowTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = await windowStage.getSubWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getSubWindow', done);
        console.log(msgStr + 'windowStage.getSubWindow(null) err=' + JSON.stringify(err));
      });
      expect(!!subWindow).assertTrue();
      console.log(msgStr + 'windowStage.getSubWindow end subWindow=' + JSON.stringify(subWindow));
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_SETPRIVACYMODE_JSAPI_001
    * @tc.name       Test setPrivacyModeTest1
    * @tc.desc       Verify the scene where the application sub window is set as a security layer
    */
    it('setPrivacyModeTest1', 0, async function (done) {
      let caseName = 'setPrivacyModeTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ');
      let mainWnd = null;
      let windowData = null
      await ohosWindow.create(context, 'setPrivacyModeTest1', ohosWindow.WindowType.TYPE_SYSTEM_ALERT)
        .then((data) => {
          windowData = data;
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        })
      expect(!!windowData).assertTrue();
      console.log(msgStr + 'window.create success windowData' + windowData);
      mainWnd = windowData;
      let firstPro = await mainWnd.getProperties().catch((err, data) => {
        unexpectedError(err, caseName, 'mainWnd.getProperties', done);
      })
      console.log(msgStr + 'mainWnd.getProperties firstPro=' + JSON.stringify(firstPro));
      expect(!firstPro.isPrivacyMode).assertTrue();
      let firstPrivacyMode = await mainWnd.setPrivacyMode(true).catch((err, data) => {
        unexpectedError(err, caseName, 'mainWnd.setPrivacyMode', done);
        console.log(msgStr + 'mainWnd.setPrivacyMode(true) err=' + JSON.stringify(err));
      })
      expect(!firstPrivacyMode).assertTrue();
      console.log(msgStr + 'mainWnd.setPrivacyMode true firstPrivacyMode=' + JSON.stringify(firstPrivacyMode));
      let secondPro = await mainWnd.getProperties().catch((err, data) => {
        unexpectedError(err, caseName, 'mainWnd.getProperties', done);
      })
      console.log(msgStr + 'mainWnd.getProperties secondPro:' + JSON.stringify(secondPro.isPrivacyMode));
      expect(secondPro.isPrivacyMode).assertTrue();
      let secondPrivacyMode = await mainWnd.setPrivacyMode(false).catch((err, data) => {
        unexpectedError(err, caseName, 'mainWnd.setPrivacyMode', done);
        console.log(msgStr + 'mainWnd.setPrivacyMode(false) err=' + JSON.stringify(err));
      })
      expect(!secondPrivacyMode).assertTrue();
      console.log(msgStr + 'mainWnd.setPrivacyMode(false) secondPrivacyMode=' + JSON.stringify(secondPrivacyMode));
      let lastPro = await mainWnd.getProperties().catch((err, data) => {
        unexpectedError(err, caseName, 'mainWnd.getProperties', done);
      })
      console.log(msgStr + 'mainWnd.getProperties lastPro:' + JSON.stringify(lastPro.isPrivacyMode));
      expect(!lastPro.isPrivacyMode).assertTrue();
      await windowData.destroy();
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_DESTROY_JSAPI_001
    * @tc.name       Test destroyTest1
    * @tc.desc       Verification window destruction scenario.
    */
    it('destroyTest1', 0, async function (done) {
      let caseName = 'destroyTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'destroyTest1';
      console.log(msgStr + 'begin');
      let createWindowObj = {
        name: windowId, windowType: baseWndType, ctx: context
      }
      let tempWnd = null;
      try {
        await ohosWindow.createWindow(createWindowObj).then((data) => {
          tempWnd = data
          console.log(msgStr + 'ohosWindow.create ' + baseWndType + ' wnd: ' + tempWnd);
          expect(!!tempWnd).assertTrue();
          console.log(msgStr + 'tempWnd.destroy start');
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        });
      } catch (err) {
        console.log(msgStr + 'destroy catch err : ' + JSON.stringify(err));
      }
      await tempWnd.destroy().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.destroy', done);
        console.log(msgStr + 'destroy err : ' + JSON.stringify(err));
      });
      console.log(msgStr + 'tempWnd.destroy end');
      let findWnd = await ohosWindow.find(windowId).catch((err) => {
        expectedError(err, caseName, 'ohosWindow.find', done, 1001);
      });
      console.log(msgStr + 'find findWnd: ' + JSON.stringify(findWnd));
      expect(!findWnd).assertTrue();
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_SETPREFERREDORIENTATION_JSAPI_001
    * @tc.name       Test setPreferredOrientationTest1
    * @tc.desc       Sets the display direction property of the window
    */
    it('setPreferredOrientationTest1', 0, async function (done) {
      let caseName = 'setPreferredOrientationTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow :' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
      'LANDSCAPE_INVERTED', 'AUTO_ROTATION', 'AUTO_ROTATION_PORTRAIT', 'AUTO_ROTATION_LANDSCAPE',
      'AUTO_ROTATION_RESTRICTED', 'AUTO_ROTATION_PORTRAIT_RESTRICTED', 'AUTO_ROTATION_LANDSCAPE_RESTRICTED', 'LOCKED', 'UNSPECIFIED'];
      for (let i = 0; i < orientationItem.length; i++) {
        let orientation = ohosWindow.Orientation[orientationItem[i]]
        console.log(msgStr + 'i : ' + i + ' ,orientation : ' + orientation);
        console.log(msgStr + 'i : ' + i + ' ,ohosWindow.Orientation : ' + JSON.stringify(ohosWindow.Orientation));
        await mainWin.setPreferredOrientation(orientation).then(() => {
          console.log(msgStr + 'success set window.setPreferredOrientation : ' + orientation);
          num++
          if (num == orientationItem.length) done();
        }).catch(err => {
          console.log(msgStr + 'window.setPreferredOrientation failed set error:' + orientation);
        });
        await sleep(3000)
      }
    })
    /**
    * @tc.number     SUB_WINDOW_SETFORBIDSPLITMOVE_JSAPI_001
    * @tc.name       Test setForbidSplitMoveTest1
    * @tc.desc       Sets whether Windows are forbidden to move in split screen mode
    */
    it('setForbidSplitMoveTest1', 0, async function (done) {
      let caseName = 'setForbidSplitMoveTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      await mainWin.setForbidSplitMove(true).then(() => {
        console.log(msgStr + 'success set window.setForbidSplitMove drag is prohibited');
      }).catch(err => {
        console.log(msgStr + 'failed set window.setForbidSplitMove drag is prohibited');
      });
      await mainWin.setForbidSplitMove(false).then(() => {
        console.log(msgStr + 'success set window.setForbidSplitMove you can drag it now');
      }).catch(err => {
        console.log(msgStr + 'failed set window.setForbidSplitMove you can drag it now');
      });
      console.log(msgStr + 'done ');
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_SNAPSHOT_JSAPI_001
    * @tc.name       Test snapshotTest1
    * @tc.desc       Scenario of screenshot of verification window
    */
    it('snapshotTest1', 0, async function (done) {
      let caseName = 'snapshotTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      await sleep(2000)
      let snapshotData = await mainWin.snapshot().catch((err) => {
        unexpectedError(err, caseName, 'mainWin.snapshot', done);
        console.log(msgStr + 'snapshot err.code:' + JSON.stringify(err.code));
      })
      expect(!!snapshotData).assertTrue();
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_DIALOGTARGETTOUCH_JSAPI_001
    * @tc.name       Test dialogTargetTouchTest1
    * @tc.desc       Verify the scenario of opening modal window
    */
    it('dialogTargetTouchTest1', 0, async function (done) {
      let caseName = 'dialogTargetTouchTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType = ohosWindow.WindowType.TYPE_DIALOG
      let dialogTargetTouchTest1Win = null;
      let createWindowObj = {
        name: 'dialogTargetTouchTest1', windowType: tempType, ctx: context
      }
      try {
        await ohosWindow.createWindow(createWindowObj).then((data) => {
          dialogTargetTouchTest1Win = data
        })
          .catch((err) => {
            unexpectedError(err, caseName, 'ohosWindow.create', done);
          })
      }
      catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow catch err' + JSON.stringify(err));
      }
      expect(!!dialogTargetTouchTest1Win).assertTrue();
      dialogTargetTouchTest1Win.destroy();
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_ANIMATIONFORSHOWN_JSAPI_001
    * @tc.name       Test animationForShownTest1
    * @tc.desc       Verify window custom animation configuration of the scene
    */
    it('animationForShownTest1', 0, async function (done) {
      let caseName = 'animationForShownTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      console.log(msgStr + 'begin ohosWindow==' + JSON.stringify(ohosWindow));
      let wndId = 'animationForShownTest1';
      let baseType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
      let tempWnd = null;
      let createWindowObj = {
        name: wndId, windowType: baseType, ctx: context
      }
      try {
        await ohosWindow.createWindow(createWindowObj).then((data) => {
          tempWnd = data
          console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + tempWnd);
          expect(!!tempWnd).assertTrue();
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
        });
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow catch err:' + JSON.stringify(err));
      }
      let controller = tempWnd.getTransitionController();
      controller.animationForShown = (context: ohosWindow.TransitionContext) => {
        let toWindow = context.toWindow
        animateTo({
          duration: 1000,
          tempo: 0.5,
          curve: Curve.EaseInOut,
          delay: 0,
          iterations: 1,
          playMode: PlayMode.Normal,
        }, () => {
          var obj: ohosWindow.TranslateOptions;
          obj.x = 100.0;
          obj.y = 0.0;
          obj.z = 0.0;
          toWindow.translate(obj);
          console.info(msgStr + 'toWindow translate end');
        }
        )
        context.completeTransition(true)
        console.info(msgStr + 'complete transition end');
      }
      await tempWnd.destroy();
      done();
    })
    /**
    * @tc.number     SUB_WINDOW_GETCUTOUTINFO_JSAPI_001
    * @tc.name       Test getCutoutInfoTest1
    * @tc.desc       Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
    */
    it('getCutoutInfoTest1', 0, async function (done) {
      let caseName = 'getCutoutInfoTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let dpClass = display.getDefaultDisplaySync();
      expect(!!dpClass).assertTrue();
      dpClass.getCutoutInfo().then((data) => {
        console.info('Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
        done();
      }).catch(err => {
        unexpectedError(err, caseName, 'displayClass.getCutoutInfo', done);
      });
    })
  })
}
