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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , Level, TestType, Size} from '@ohos/hypium';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import injectTouchEvent from 'libentry.so';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import settings from '@ohos.settings';
import { Driver, ON } from '@kit.TestKit';

function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function InjectTouchEvent() {
  describe('injectTouchEvent', () => {
    let windowStage:window.WindowStage;
    let Tag = 'ActsWindowNdkTest';
    let WindowClass:window.Window;
    let windowId:number;
    let context : common.UIAbilityContext;
    let isAutoWindow:string = '';
    let isPCStatus: string = '';
    beforeAll(async() => {
      windowStage = AppStorage.get("windowStage") as window.WindowStage;
      console.log(`${Tag}:beforeAll start... `);
      WindowClass = await windowStage.getMainWindow();
      windowId = WindowClass.getWindowProperties().id;
      console.log(`${Tag}:windowId:${windowId} `);
      context = AppStorage.get("context") as common.UIAbilityContext;
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.DEVICE_SHARED);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    })
    beforeEach(() => {
      console.log(`${Tag}:beforeEach start... `);
    })
    afterEach(() => {
      console.log(`${Tag}:afterEach start... `);
    })
    afterAll(() => {
      console.log(`${Tag}:afterAll start... `);
    })


    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0100
     * @tc.name      : testInjectTouchEventwithTouchEventNullptr
     * @tc.desc      : 验证injectTouchEvent接口中入参touchEvent为空返回401错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithTouchEventNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithTouchEventNullptr';
      console.info(`${Tag}: ${caseName} windowId: ${windowId}`);
      try {
        let result = injectTouchEvent.testInjectTouchEventwithTouchEventNullptr(windowId);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        expect(result).assertEqual(401);
        done()
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0200
     * @tc.name      : testInjectTouchEventwithTouchEventActionOutofRange
     * @tc.desc      : 验证injectTouchEvent接口中入参toucheEvent中Action超出范围取值10时返回1300003错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithTouchEventActionOutofRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithTouchEventActionOutofRange';
      console.info(`${Tag}: ${caseName} windowId: ${windowId}`);
      try {
        let result = injectTouchEvent.testInjectTouchEventwithTouchEventActionOutofRange(windowId);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        expect(result).assertEqual(1300003);
        done()
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0300
     * @tc.name      : testInjectTouchEventwithWindowidNotloadcontent
     * @tc.desc      : 验证injectTouchEvent接口中入参windowid窗口未loadcontent抛出1300003错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testInjectTouchEventwithWindowidNotloadcontent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithWindowidNotloadcontent';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithWindowidNotloadcontent');
      try {
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithWindowidNotloadcontent(subWindowId);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        await subWindowClass.destroyWindow();
        expect(result).assertEqual(1300003);
        done()
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0400
     * @tc.name      : testInjectTouchEventwithDestoryedSubwindow
     * @tc.desc      : 验证injectTouchEvent接口中入参windowid为销毁后的子窗返回1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testInjectTouchEventwithDestoryedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithDestoryedSubwindow';
      try {
        let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithDestoryedSubwindow');
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        await subWindowClass.destroyWindow();
        let result = injectTouchEvent.testInjectTouchEventwithDestoryedSubwindow(subWindowId);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        expect(result).assertEqual(1300002);
        done()
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0500
     * @tc.name      : testInjectTouchEventwithWindowXWindowYBeyondScreen
     * @tc.desc      : 验证injectTouchEvent接口中入参windowX、windowY超出窗口范围
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithWindowXWindowYBeyondScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithWindowXWindowYBeyondScreen';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithWindowXWindowYBeyondScreen');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${Tag}: ${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        let width = windowLimits.minWidth as number;
        let height = windowLimits.minHeight as number;
        await subWindowClass.resize(width, height);
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithWindowXWindowYBeyondScreen(subWindowId, width + 50, height + 50);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          await subWindowClass.destroyWindow();
          expect(result).assertEqual(0);
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        if(err.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
        
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0600
     * @tc.name      : testInjectTouchEventwithFloatWindowXWindowY
     * @tc.desc      : 验证injectTouchEvent接口中入参windowX、windowY为float类型会截断取整
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithFloatWindowXWindowY', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithFloatWindowXWindowY';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithFloatWindowXWindowY');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${Tag}: ${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        let width = windowLimits.minWidth as number;
        let height = windowLimits.minHeight as number;
        await subWindowClass.resize(width, height);
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithFloatWindowXWindowY(subWindowId, width - 0.001, height - 0.001);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          await subWindowClass.destroyWindow();
          expect(result).assertEqual(0);
          done()
        }
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        if(err.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
        
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0700
     * @tc.name      : testInjectTouchEventwithNonExistedWindowID
     * @tc.desc      : 验证injectTouchEvent接口中入参windowId传入大于0但不存在的windowid
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithNonExistedWindowID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithNonExistedWindowID';
      try {
        let invalidId = 1000;
        let result = injectTouchEvent.testInjectTouchEventwithNonExistedWindowID(invalidId);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        expect(result).assertEqual(1300002);
        done()
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0800
     * @tc.name      : testInjectTouchEventwithFloatWindowID
     * @tc.desc      : 验证injectTouchEvent接口中入参windowId为float类型会向下取整
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testInjectTouchEventwithFloatWindowID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithFloatWindowID';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithFloatWindowID');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        // 获取button的位置
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithFloatWindowID(subWindowId + 0.4, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result == 1300003){
          await subWindowClass.destroyWindow();
          done();
        }else{
          expect(result).assertEqual(0);
          await sleep(200);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('TextChanged');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_0900
     * @tc.name      : testInjectTouchEventwithNegativeWindowID
     * @tc.desc      : 验证injectTouchEvent接口中入参windowId传入-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithNegativeWindowID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithNegativeWindowID';
      try {
        let result = injectTouchEvent.testInjectTouchEventwithNegativeWindowID();
        console.info(`${Tag}: ${caseName} result: ${result}`);
        expect(result).assertEqual(401);
        done()
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1000
     * @tc.name      : testInjectTouchEventwithTouchActionCancel
     * @tc.desc      : 验证injectTouchEvent接口向子窗注入0触屏取消场景
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithTouchActionCancel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithTouchActionCancel';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithTouchActionCancel');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithTouchActionCancel(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result == 1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('Button');
          await subWindowClass.destroyWindow();
          done()
        }
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1100
     * @tc.name      : testInjectTouchEventwithTouchActionDown
     * @tc.desc      : 验证injectTouchEvent接口向子窗注入1触屏按下场景
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithTouchActionDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithTouchActionDown';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithTouchActionDown');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithTouchActionDown(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('Button');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1200
     * @tc.name      : testInjectTouchEventwithTouchActionMove
     * @tc.desc      : 验证injectTouchEvent接口向子窗注入2触屏移动场景
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithTouchActionMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithTouchActionMove';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithTouchActionMove');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithTouchActionMove(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let sliderText = await driver.findComponent(ON.id('sliderTextId'));
          console.info(`${Tag}: ${caseName} sliderText: ${sliderText}`);
          await sleep(500);
          let newText = await sliderText.getText();
          console.info(`${Tag}: ${caseName} newText: ${newText}`);
          await sleep(200);
          if (newText == '40') {
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          await subWindowClass.destroyWindow();
          done()
        }

        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1300
     * @tc.name      : testInjectTouchEventwithTouchActionUp
     * @tc.desc      : 验证injectTouchEvent接口向子窗注入3触屏抬起场景
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testInjectTouchEventwithTouchActionUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithTouchActionUp';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithTouchActionUp');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithTouchActionUp(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('Button');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1400
     * @tc.name      : testInjectTouchEventwithMainWindowClick
     * @tc.desc      : 验证injectTouchEvent接口向主窗注入13点击事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testInjectTouchEventwithMainWindowClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithMainWindowClick';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithMainWindowClick');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithMainWindowClick(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          await sleep(200);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('TextChanged');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1500
     * @tc.name      : testInjectTouchEventwithSubWindowClick
     * @tc.desc      : 验证injectTouchEvent接口向子窗注入13点击事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testInjectTouchEventwithSubWindowClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithSubWindowClick';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithSubWindowClick');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithSubWindowClick(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          await sleep(400);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('TextChanged');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1600
     * @tc.name      : testInjectTouchEventwithDialogWindowClick
     * @tc.desc      : 验证injectTouchEvent接口向系统窗注入13点击事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testInjectTouchEventwithDialogWindowClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithDialogWindowClick';
      let config: window.Configuration = {
        name: "dialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass = await window.createWindow(config);
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithDialogWindowClick(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          await sleep(400);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('TextChanged');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1700
     * @tc.name      : testInjectTouchEventwithSubWindowSlide
     * @tc.desc      : 验证injectTouchEvent接口向子窗注入123滑动事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testInjectTouchEventwithSubWindowSlide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithSubWindowSlide';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithSubWindowSlide');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let slider = await driver.findComponent(ON.id('sliderId'));
        console.info(`${Tag}: ${caseName} slider: ${slider}`);
        let point = await slider.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithSubWindowSlide(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let sliderText = await driver.findComponent(ON.id('sliderTextId'));
          console.info(`${Tag}: ${caseName} sliderText: ${sliderText}`);
          await sleep(500);
          let newText = await sliderText.getText();
          console.info(`${Tag}: ${caseName} newText: ${newText}`);
          await sleep(200);
          if (newText != '40') {
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_1800
     * @tc.name      : testInjectTouchEventwithSubWindowEdgeSlide
     * @tc.desc      : 验证injectTouchEvent接口向子窗边缘注入123滑动事件不响应
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testInjectTouchEventwithSubWindowEdgeSlide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithSubWindowEdgeSlide';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithSubWindowEdgeSlide');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${Tag}: ${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        await subWindowClass.resize(minWidth, minHeight);
        await sleep(200);
        let windowRect = subWindowClass.getWindowProperties().windowRect;
        console.info(`${Tag}: ${caseName} windowRect: ${JSON.stringify(windowRect)}`);
        let x = windowRect.width + windowRect.left;
        let y = windowRect.height + windowRect.top;
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithSubWindowEdgeSlide(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let windowProperties =  subWindowClass.getWindowProperties();
          let windowWidth = windowProperties.windowRect.width;
          let windowHeight = windowProperties.windowRect.height;
          console.info(`${Tag}: ${caseName} windowWidth: ${windowWidth}; windowHeight: ${windowHeight}`);
          expect(Math.abs(windowWidth-minWidth)).assertLessOrEqual(1);
          expect(Math.abs(windowHeight-minHeight)).assertLessOrEqual(1);
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        if(err.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_2100
     * @tc.name      : testInjectTouchEventwithSubWindowButtonDownCancle
     * @tc.desc      : 验证injectTouchEvent接口向子窗button组件注入10按下后取消事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('testInjectTouchEventwithSubWindowButtonDownCancle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithSubWindowButtonDownCancle';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithSubWindowButtonDownCancle');
      await sleep(200);
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('buttonId'));
        console.info(`${Tag}: ${caseName} btn: ${btn}`);
        let point = await btn.getBoundsCenter();
        console.info(`${Tag}: ${caseName} point: ${JSON.stringify(point)}`);
        let x = point.x
        let y = point.y
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithSubWindowButtonDownCancle(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let newText = await btn.getText();
          await sleep(200);
          expect(newText).assertEqual('Button');
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_2200
     * @tc.name      : testInjectTouchEventwithSubWindowSlideDownCancle
     * @tc.desc      : 验证injectTouchEvent接口向子窗滑动组件注入10按下后取消事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testInjectTouchEventwithSubWindowSlideDownCancle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithSubWindowSlideDownCancle';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithSubWindowSlideDownCancle');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
        let driver = Driver.create();
        let slider = await driver.findComponent(ON.id('sliderId'));
        console.info(`${Tag}: ${caseName} slider: ${slider}`);
        let rect = await slider.getBounds();
        console.info(`${Tag}: ${caseName} rect: ${JSON.stringify(rect)}`);
        let x = rect.right
        let y = Math.abs(rect.top - rect.bottom) / 2;
        await sleep(200);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let result = injectTouchEvent.testInjectTouchEventwithSubWindowSlideDownCancle(subWindowId, x, y);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let sliderText = await driver.findComponent(ON.id('sliderTextId'));
          await sleep(500);
          let newText = await sliderText.getText();
          await sleep(200);
          if (newText != '100') {
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          await subWindowClass.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_INJECTOUCHEVENT_2300
     * @tc.name      : testInjectTouchEventwithHideSubWindowDown
     * @tc.desc      : 验证injectTouchEvent接口向被遮挡子窗注入13按下事件
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testInjectTouchEventwithHideSubWindowDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testInjectTouchEventwithHideSubWindowDown';
      let subWindowClass = await windowStage.createSubWindow('testInjectTouchEventwithHideSubWindowDown1');
      await sleep(200);
      let subWindowClass2 = await windowStage.createSubWindow('testInjectTouchEventwithHideSubWindowDown2');
      await sleep(200);
      await subWindowClass.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass.showWindow();
      await sleep(200);
      try {
      let windowLimits = subWindowClass.getWindowLimits();
      console.info(`${Tag}: ${caseName} subWindowClass windowLimits: ${JSON.stringify(windowLimits)}`);
      let minWidth = windowLimits.minWidth as number;
      let minHeight = windowLimits.minHeight as number;
      await subWindowClass.moveWindowTo(minWidth, minHeight);
      await sleep(200);
      await subWindowClass.resize(minWidth + 100, minHeight + 100);
      await subWindowClass2.setUIContent('testability/pages/subWindow');
      await sleep(200);
      await subWindowClass2.showWindow();
      await sleep(200);
      let windowLimits2 = subWindowClass2.getWindowLimits();
      console.info(`${Tag}: ${caseName} subWindowClass2 windowLimits2: ${JSON.stringify(windowLimits2)}`);
      let minWidth2 = windowLimits2.minWidth as number;
      let minHeight2 = windowLimits2.minHeight as number;
      await subWindowClass.moveWindowTo(minWidth2, minHeight2);
      await sleep(200);
      await subWindowClass.resize(minWidth2 + 50, minHeight2 + 50);
      
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId: ${subWindowId}`);
        let subWindowId2 =  subWindowClass2.getWindowProperties().id;
        console.info(`${Tag}: ${caseName} subWindowId2: ${subWindowId2}`);
        let result = injectTouchEvent.testInjectTouchEventwithHideSubWindowDown(subWindowId, 70, 70);
        console.info(`${Tag}: ${caseName} result: ${result}`);
        if(result==1300003){
          await subWindowClass.destroyWindow();
          await subWindowClass2.destroyWindow();
          done()
        }else{
          expect(result).assertEqual(0);
          let focused = subWindowClass.isFocused();
          console.info(`${Tag}: ${caseName} focused: ${focused}`);
          expect(focused).assertEqual(false);
          let topWindow = await window.getLastWindow(context);
          await sleep(200);
          let topWindowId = topWindow.getWindowProperties().id;
          console.info(`${Tag}: ${caseName} topWindowId: ${topWindowId}`);
          expect(topWindowId).assertEqual(subWindowId2);
          await subWindowClass.destroyWindow();
          await subWindowClass2.destroyWindow();
          done()
        }
        
      } catch (err) {
        console.info(`${Tag}: ${caseName} Failed, err: ${JSON.stringify(err)}`);
        await subWindowClass.destroyWindow();
        await subWindowClass2.destroyWindow();
        if(err.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
        
      }
    })


  })
}