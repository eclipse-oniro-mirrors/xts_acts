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
import deviceInfo from '@ohos.deviceInfo';

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

    let currentDeviceIsRk = false;
    beforeAll(function () {
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0760
     * @tc.name      : testListener_Sys_AvoidAreaChange_Promise
     * @tc.desc      : Verify whether the change monitoring of avoidance area can be started normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_Sys_AvoidAreaChange_Promise', 0, async function (done) {
      await sleep(1000)
      let caseName = 'testListener_Sys_AvoidAreaChange_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOnFlag = false;
      console.log(msgStr + 'begin');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      await tempWnd.setWindowLayoutFullScreen(true).catch((err) => {
        console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0770
     * @tc.name      : testListener_windowSizeChange
     * @tc.desc      : Verify that the window size avoidance area changes and monitor whether it can be opened normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_windowSizeChange', 0, async function (done) {
      await sleep(1000)
      let caseName = 'testListener_windowSizeChange';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wndId = 'listenerTest2';
      let baseType = ohosWindow.WindowType.TYPE_FLOAT;
      let changedModel = 102;
      let baseValue = 100;
      let resizeValue = 200;
      console.log(msgStr + 'begin');
      let flag = false;
      let tempWnd = null;
      try {
        await ohosWindow.create(context, wndId, baseType).then((data) => {
          tempWnd = data
          console.log(msgStr + 'ohosWindow.create data:' + JSON.stringify(data));
        }).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
        });
        console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.create catch err:' + JSON.stringify(err));
      }
      await sleep(1000);
      await tempWnd.on('windowSizeChange', async (sizeData) => {
        console.log(msgStr + 'tempWnd.on windowSizeChange, systemBatData : ' + JSON.stringify(sizeData));
        if (flag) {
          expect(!!sizeData).assertTrue();
          tempWnd.off('windowSizeChange');
          await tempWnd.destroy();
          done();
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
      flag = true
      await tempWnd.resetSize(resizeValue, resizeValue).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize(' + resizeValue + ', ' + resizeValue + ')', done);
      });
      await sleep(1500);
      console.log(msgStr + 'tempWnd.resetSize(' + resizeValue + ', ' + resizeValue + ') success');
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0740
     * @tc.name      : testListener_SystemAvoidAreaChange_Off
     * @tc.desc      : Verify whether the change monitoring of avoidance area can be started normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_SystemAvoidAreaChange_Off', 0, async function (done) {
      await sleep(1000)
      let caseName = 'testListener_SystemAvoidAreaChange_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOffFlag = listenerStatus.ready;
      console.log(msgStr + 'begin 1');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.setWindowLayoutFullScreen(true).catch((err) => {
        console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      tempWnd.on('systemAvoidAreaChange', (avoidAreaData) => {
        console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, systemBatData : ' + JSON.stringify(avoidAreaData));
        tempWnd.off('systemAvoidAreaChange');
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
      await sleep(500);
      console.log(msgStr + 'tempWnd.off systemAvoidAreaChange finished');
      listenerOffFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      await sleep(500);
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0780
     * @tc.name      : testListener_windowSizeChange_Off
     * @tc.desc      : Verify whether the window size change monitoring can be closed normally.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_windowSizeChange_Off', 0, async function (done) {
      await sleep(1000)
      let caseName = 'testListener_windowSizeChange_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wndId = 'listenerTest4';
      let baseType = ohosWindow.WindowType.TYPE_FLOAT;
      let changedModel = 102;
      let listenerOffFlag = false;
      console.log(msgStr + 'begin');
      let createWindowObj = {
        name: wndId, windowType: baseType, ctx: context
      }
      console.log(msgStr + 'ohosWindow.create createWindowObj:' + JSON.stringify(createWindowObj));
      let tempWnd = null;
      await ohosWindow.create(context, wndId, baseType).then((data) => {
        console.log(msgStr + 'ohosWindow.create data:' + JSON.stringify(data));
        tempWnd = data
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
      await tempWnd.on('windowSizeChange', async (sizeData) => {
        console.log(msgStr + 'tempWnd.on windowSizeChange, sizeData : ' + JSON.stringify(sizeData));
        expect(sizeData.width === 100).assertTrue();
        expect(sizeData.height === 100).assertTrue();
        tempWnd.off('windowSizeChange');
        await tempWnd.destroy();
        done();

      })
      console.log(msgStr + 'tempWnd.on windowSizeChange finished');
      await tempWnd.resetSize(100, 100).then(() => {
        listenerOffFlag = true;
        console.log(msgStr + 'listenerOffFlag:' + listenerOffFlag);
      }).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize(100, 100)', done);
      });
      console.log(msgStr + 'tempWnd.resetSize(100, 100) success');
      await sleep(1500)
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1310
     * @tc.name      : testSetSystemBarEnable_ShowStatusBar_HideNavBar_Promise
     * @tc.desc      : Verify that the scene shows the status bar and hides the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_ShowStatusBar_HideNavBar_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_ShowStatusBar_HideNavBar_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
      await sleep(500);
      await tempWnd.setSystemBarEnable(['status']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1240
     * @tc.name      : testSetSystemBarEnable_HideStatusBar_ShowNavBar_Promise
     * @tc.desc      : Verify that the scene hides the status bar and displays the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_HideStatusBar_ShowNavBar_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_HideStatusBar_ShowNavBar_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
      await tempWnd.setSystemBarEnable(['navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1330
     * @tc.name      : testSetSystemBarEnable_Show_StatusBarAndNavBar_Promise
     * @tc.desc      : Verify that the scene displays both the status bar and the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Show_StatusBarAndNavBar_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Show_StatusBarAndNavBar_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
      await sleep(500);
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success .');
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1260
     * @tc.name      : testSetSystemBarEnable_Hide_StatusBarAndNavBar_Promise
     * @tc.desc      : Verify that the scene hides both the status bar and the navigation bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Hide_StatusBarAndNavBar_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Hide_StatusBarAndNavBar_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
      await sleep(500);
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
     * @tc.name      : testSetSystemBarEnable_Invalid_Parameter_Promise
     * @tc.desc      : Verify the scene where illegal values are entered when the status bar and navigation bar are displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Invalid_Parameter_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Invalid_Parameter_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1390
     * @tc.name      : testSetSystemBarProperties_RGB_Promise
     * @tc.desc      : Verify the scene where the colors of the status bar and navigation bar are set in RGB
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarProperties_RGB_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarProperties_RGB_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonRGBColorArr));
      let compareCount = 0;
      console.log(msgStr + 'begin');
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
      await sleep(500);
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
          done();
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1370
     * @tc.name      : testSetSystemBarProperties_KeywordForm_Promise
     * @tc.desc      : Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarProperties_KeywordForm_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarProperties_KeywordForm_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = {
        SBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        SCC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NCC: JSON.parse(JSON.stringify(commonNUMBERColorArr))
      };
      let compareCount = 0;
      console.log(msgStr + 'begin');
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
      await sleep(500);
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
          done();
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1350
     * @tc.name      : testSetSystemBarProperties_Hexadecimal_Promise
     * @tc.desc      : Verify the scene where the status bar and navigation bar colors are set as keywords
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarProperties_Hexadecimal_Promise', 0, async function (done) {
      let caseName = 'testSetSystemBarProperties_Hexadecimal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonKEYColorArr));
      let compareCount = 0;
      console.log(msgStr + 'begin');
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
      await sleep(500);
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
          done();
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0180
     * @tc.name      : testCreate_App_Type_Win_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_App_Type_Win_Promise', 0, async function (done) {
      let caseName = 'testCreate_App_Type_Win_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0260
     * @tc.name      : testCreate_Sys_Type_Win_Promise
     * @tc.desc      : Verify the scenario of creating the system type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Sys_Type_Win_Promise', 0, async function (done) {
      let caseName = 'testCreate_Sys_Type_Win_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log(msgStr + ' loopCount: ' + loopCount);
      let n = 0
      for (let i = 0; i < loopCount; i++) {
        let tempType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0220
     * @tc.name      : testCreate_Not_Exist_Win_Promise
     * @tc.desc      : Verify the scenario of creating a window of a type that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Not_Exist_Win_Promise', 0, async function (done) {
      let caseName = 'testCreate_Not_Exist_Win_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0240
     * @tc.name      : testCreate_Repeate_Id_Win_Promise
     * @tc.desc      : Verify the scenario of creating a window with duplicate IDs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Repeate_Id_Win_Promise', 0, async function (done) {
      let caseName = 'testCreate_Repeate_Id_Win_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameids'
      let ohosData = null;
      await ohosWindow.create(context, windowId, ohosWindow.WindowType.TYPE_FLOAT).then(
        (data) => {
          ohosData = data;
        }).catch((err) => {
        console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
        unexpectedError(err, caseName, 'ohosWindow.create', done);
      })
      expect(!!ohosData).assertTrue();
      let ohosDataError = await ohosWindow.create(context, windowId, 1).catch((err) => {
        console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300001)
        done();
      })
      await ohosData.destroy();
      console.log(msgStr + 'ohosWindow.create 1 twice ohosDataError: ' + JSON.stringify(ohosDataError));
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name      : testLoadContent_Exist_Create_SysWin_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Create_SysWin_Promise', 0, async function (done) {
      let caseName = 'testLoadContent_Exist_Create_SysWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
        expect().assertFail();
        done();
      }
      expect(!!tempWnd).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent start');
      await tempWnd.loadContent('pages/second/second').then(() => {
        console.info(msgStr + ' Succeeded in loading the content.');
        expect().assertFail();
        done();
      }).catch((err) => {
        expect(err.code).assertEqual(401);
        console.log(msgStr + 'tempWnd.loadContent(pages/second/second) err=' + JSON.stringify(err));
      });
      await tempWnd.destroy();
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0880
     * @tc.name      : testLoadContent_Para_Is_Null_Create_SysWin_Promise
     * @tc.desc      : Verify the scene of loading the page with illegal values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Para_Is_Null_Create_SysWin_Promise', 0, async function (done) {
      let caseName = 'testLoadContent_Para_Is_Null_Create_SysWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0840
     * @tc.name      : testLoadContent_Exist_Input_Para_Path_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Input_Para_Path_Promise', 0, async function (done) {
      let caseName = 'testLoadContent_Exist_Input_Para_Path_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0860
     * @tc.name      : testLoadContent_Input_Para_Is_Null_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Input_Para_Is_Null_Promise', 0, async function (done) {
      let caseName = 'testLoadContent_Input_Para_Is_Null_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load4 = await windowStage.loadContent(null).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load5=' + JSON.stringify(load4));
      }
      catch (err) {
        console.log(msgStr + 'windowStage loadContent catch err=' + JSON.stringify(err));
        expectedError(err.code, caseName, 'tempWnd.loadContent', done, 401);
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0820
     * @tc.name      : testLoadContent_Exist_Input_Para_PathAndStorage_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Input_Para_PathAndStorage_Promise', 0, async function (done) {
      let caseName = 'testLoadContent_Exist_Input_Para_PathAndStorage_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load5 = await windowStage.loadContent(null, abilityStorage).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load5=' + JSON.stringify(load5));
      }
      catch (err) {
        console.log(msgStr + 'windowStage loadContent catch err=' + JSON.stringify(err));
        expectedError(err.code, caseName, 'windowStage loadContent', done, 401);
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name      : testLoadContent_Para_PathAndStorage_Is_Null_Promise
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Para_PathAndStorage_Is_Null_Promise', 0, async function (done) {
      let caseName = 'testLoadContent_Para_PathAndStorage_Is_Null_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0050
     * @tc.name      : testCreateSubWindow_WinName_IsNot_Empty_Promise
     * @tc.desc      : Verify the scenario of creating an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindow_WinName_IsNot_Empty_Promise', 0, async function (done) {
      let caseName = 'testCreateSubWindow_WinName_IsNot_Empty_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0070
     * @tc.name      : testCreateSubWindow_WinName_Is_Null_Promise
     * @tc.desc      : Verify the scene of entering illegal values to create an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindow_WinName_Is_Null_Promise', 0, async function (done) {
      let caseName = 'testCreateSubWindow_WinName_Is_Null_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0590
     * @tc.name      : testGetSubWindow_Promise
     * @tc.desc      : Verify the scene of obtaining all auxiliary sub windows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSubWindow_Promise', 0, async function (done) {
      let caseName = 'testGetSubWindow_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.name      : testSetPrivacyMode_SppSubWin_Promise
     * @tc.desc      : Verify the scene where the application sub window is set as a security layer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPrivacyMode_SppSubWin_Promise', 0, async function (done) {
      let caseName = 'testSetPrivacyMode_SppSubWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ');
      let mainWnd = null;
      let windowData = null
      await ohosWindow.create(context, 'setPrivacyModeTest1', ohosWindow.WindowType.TYPE_FLOAT)
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0310
     * @tc.name      : testDestroy_Promise
     * @tc.desc      : Verification window destruction scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDestroy_Promise', 0, async function (done) {
      let caseName = 'testDestroy_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1180
     * @tc.name      : testSetPreferredOrientation_Promise
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_Promise', 0, async function (done) {
      let caseName = 'testSetPreferredOrientation_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1120
     * @tc.name      : testSetForbidSplitMove_Promise
     * @tc.desc      : Sets whether Windows are forbidden to move in split screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetForbidSplitMove_Promise', 0, async function (done) {
      let caseName = 'testSetForbidSplitMove_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2160
     * @tc.name      : testSnapshotTest_Promise_Form
     * @tc.desc      : Scenario of screenshot of verification window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSnapshotTest_Promise_Form', 0, async function (done) {
      let caseName = 'testSnapshotTest_Promise_Form';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0330
     * @tc.name      : testDialogTargetTouch_Promise
     * @tc.desc      : Verify the scenario of opening modal window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDialogTargetTouch_Promise', 0, async function (done) {
      let caseName = 'testDialogTargetTouch_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0020
     * @tc.name      : testAnimationForShown_Promise
     * @tc.desc      : Verify window custom animation configuration of the scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testAnimationForShown_Promise', 0, async function (done) {
      let caseName = 'testAnimationForShown_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      console.log(msgStr + 'begin ohosWindow==' + JSON.stringify(ohosWindow));
      let wndId = 'animationForShownTest1';
      let baseType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.name      : testGetCutoutInfo_Promise
     * @tc.desc      : Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetCutoutInfo_Promise', 0, async function (done) {
      let caseName = 'testGetCutoutInfo_Promise';
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
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1080
     * @tc.name      : testSetAspectRatio_Cancel_Upon_Success_Promise
     * @tc.desc      : Validate the scenario cancelled after setting the proportion of the content layout of the main window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_Cancel_Upon_Success_Promise', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Cancel_Upon_Success_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd = null;
      await windowStage.getMainWindow().then((data) => {
        mainWnd = data;
        expect(!!mainWnd).assertTrue();
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      });
      try {
        let ratio = 1.0;
        await mainWnd.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
      }
      try {
        await mainWnd.resetAspectRatio().then(() => {
          console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause: ' + JSON.stringify(exception));
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2340
     * @tc.name      : testSetAspectRatio_Invalid_Params_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_Invalid_Params_Promise', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Invalid_Params_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd = null;
      await windowStage.getMainWindow().then((data) => {
        mainWnd = data;
        expect(!!mainWnd).assertTrue();
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      });
      try {
        let ratio = 0;
        await mainWnd.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expectedError(exception, caseName, 'mainWnd.setAspectRatio', done, 401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2320
     * @tc.name      : testWindowEventType_Enum
     * @tc.desc      : Test the enumeration value of WindowEventType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWindowEventType_Enum', 0, async function (done) {
      let caseName = 'testWindowEventType_Enum';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.log(msgStr + 'ohosWindow.WindowEventType:' + JSON.stringify(ohosWindow.WindowEventType));
      try {
        expect(1).assertEqual(ohosWindow.WindowEventType.WINDOW_SHOWN);
        expect(2).assertEqual(ohosWindow.WindowEventType.WINDOW_ACTIVE);
        expect(3).assertEqual(ohosWindow.WindowEventType.WINDOW_INACTIVE);
        expect(4).assertEqual(ohosWindow.WindowEventType.WINDOW_HIDDEN);
        done();
      } catch (err) {
        console.info(msgStr + 'windowEventType error :' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2310
     * @tc.name      : testOrientation_Enum
     * @tc.desc      : Test the enumeration value of Orientation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOrientation_Enum', 0, async function (done) {
      let caseName = 'testOrientation_Enum';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      console.log(msgStr + 'display.orientation:' + JSON.stringify(display.Orientation));
      try {
        expect(0).assertEqual(display.Orientation.PORTRAIT);
        expect(1).assertEqual(display.Orientation.LANDSCAPE);
        expect(2).assertEqual(display.Orientation.PORTRAIT_INVERTED);
        expect(3).assertEqual(display.Orientation.LANDSCAPE_INVERTED);
        done();
      } catch (err) {
        console.info(msgStr + 'Orientation error :' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
    * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
    * @tc.name      : testSetSpecificSystemBarEnabled_Function_Promise
    * @tc.desc      : Test the function of setSpecificSystemBarEnabled
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('testSetSpecificSystemBarEnabled_Function_Promise', 0, async function(done){
      let msgStr = 'testSetSpecificSystemBarEnabled';
      console.log(msgStr + 'begin')
      try {
        let windowClass = await ohosWindow.getLastWindow(context);
        let specificSystemBar: ohosWindow.SpecificSystemBar = 'navigationIndicator'
        let promise = windowClass.setSpecificSystemBarEnabled(specificSystemBar, false);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in setting the system bar to be invisible.');
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1220
     * @tc.name      : testSetWindowDecorVisible
     * @tc.desc      : test the function of SetWindowDecorVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowDecorVisible', 0, async function (done) {
      let msgStr = 'testSetWindowDecorVisible';
      console.log(msgStr + ' begin');
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        let isVisible = true;
        // 调用setWindowDecorVisible接口
        try {
          wnd.setWindowDecorVisible(isVisible);
          expect(true).assertTrue()
          done()

        } catch (exception) {
          console.error(msgStr + 'Failed to set the visibility of window decor. Cause: ' + JSON.stringify(exception));
          if (!currentDeviceIsRk) {
            console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + +JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
            done();
          }
        }
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1230
     * @tc.name      : testSetWindowDecorHeight
     * @tc.desc      : test the function of SetWindowDecorHeight
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowDecorHeight', 0, async function (done) {
        let msgStr = 'testSetWindowDecorHeight';
        console.log(msgStr + ' begin');
        let height = 50
        ohosWindow.getLastWindow(context).then(wnd => {
          console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
          expect(wnd != null).assertTrue();
          try {
            wnd.setWindowDecorHeight(height);
            expect(true).assertTrue()
            done()
          } catch (exception) {
            console.error(msgStr + ' Failed to set the height of window decor. Cause: ' + JSON.stringify(exception));
            if (!currentDeviceIsRk) {
              console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
              expect().assertFail();
              done();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + +JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
              done();
            }
          }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1240
     * @tc.name      : testGetWindowDecorHeight
     * @tc.desc      : test the function of GetWindowDecorHeight
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetWindowDecorHeight', 0, async function (done) {
      let caseName = 'www data';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load3 = await windowStage.loadContent('MainAbility/pages/second/second').catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
        console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
      });
      expect(!load3).assertTrue();
      try {
        let tempWnd = await windowStage.getMainWindow().catch((err) => {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        });
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);

        let height = tempWnd.getWindowDecorHeight();
        expect(true).assertTrue()
        done()
      } catch (exception) {
        console.error(msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
        if (exception.code == 801 || exception.code == 1300002) {
            expect(true).assertTrue()
            done()
        } else {
            expect().assertFail();
            done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1250
     * @tc.name      : testSubWindowOptions
     * @tc.desc      : test the function of SubWindowOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSubWindowOptions', 0, async function (done) {
        let msgStr = 'testSubWindowOptions';
        console.log(msgStr + ' begin');
        let windowClass = undefined;
        try {
            console.log(msgStr + ' www data try' )
            let options = {
                title: 'title',
                decorEnabled: true
            };

            let promise = windowStage.createSubWindowWithOptions('mySubWindow', options);
            console.log(msgStr + ' www data ' + promise)

            promise.then((data) => {
                windowClass = data;
                console.log(msgStr + ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                expect(true).assertTrue()
                done()
            }).catch((err) => {
                console.error(msgStr + ' www data111 Failed to create the subwindow. Cause: ' + JSON.stringify(err));
                if (err.code == 801 || err.code == 1300002) {
                expect(true).assertTrue()
                done()
                } else {
                    expect().assertFail();
                    done();
                }
            });
            } catch (exception) {
            console.error(msgStr + ' www data222 Failed to create the subwindow. Cause: ' + JSON.stringify(exception));
            if (exception.code == 801 || exception.code == 1300002) {
                expect(true).assertTrue()
                done()
            } else {
                expect().assertFail();
                done();
            }
            }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1260
     * @tc.name      : testKeepKeyboardOnFocus
     * @tc.desc      : test the function of KeepKeyboardOnFocus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testKeepKeyboardOnFocus', 0, async function (done) {
        let msgStr = 'testKeepKeyboardOnFocus';
        console.log(msgStr + ' begin');
        ohosWindow.getLastWindow(context).then(wnd => {
            console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            try {
                wnd.keepKeyboardOnFocus(true);
                expect(true).assertTrue()
                done()
            } catch (exception) {
                console.error(msgStr + ' Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
                if (exception.code == 801 || exception.code == 1300004) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testShiftAppWindowFocus_Function_Promise
     * @tc.desc      : Test the function value of shiftAppWindowFocus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_Function_Promise', 0, async function(done){
      let msgStr = 'testShiftAppWindowFocus_Function_Promise';
      console.log(msgStr + 'begin');
      try {
        console.log(msgStr + 'try begin')
        let sourceWindowId = 40;
        let targetWindowId = 41;
        let promise = ohosWindow.shiftAppWindowFocus(sourceWindowId, targetWindowId);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in shifting app window focus');
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(msgStr + 'Failed to shift app window focus1. Cause:' + JSON.stringify(error));
          if (error.code == 801 || error.code == 1300002) {
              expect(true).assertTrue()
              done()
          } else {
              expect().assertFail();
              done();
          }     
        })
      } catch (error) {
        console.log(msgStr + 'Failed to shift app window focus2. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })    

  })
}
