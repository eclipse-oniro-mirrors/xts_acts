/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , Level, TestType, Size} from '@ohos/hypium';
import testNapi from 'libentry.so';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import pipWindow from '@ohos.PiPWindow';
import { Driver, ON } from '@ohos.UiTest';

export default function PipWindowNdkTest() {
  describe('ActsPipWindowNdkTest', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let OK = 0;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      try {
          let driver = Driver.create();
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.log('findComponent allowed: ' + JSON.stringify(allowed));
          if(allowed){
            await allowed.click();
          }
        } catch (err) {
          console.error('findComponent allowed failed: ' + JSON.stringify(err));
        }
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testPipTemplateTypeEnum
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPTEMPLATETYPE_ENUM_0100
     * @tc.desc   PictureInPicture_PipTemplateType枚举值校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipTemplateTypeEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipTemplateTypeEnum';
      try{
        let result: testNapi.PipTemplateType  = testNapi.testPipTemplateTypeEnum();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result.VIDEO_PLAY).assertEqual(0);
        expect(result.VIDEO_CALL).assertEqual(1);
        expect(result.VIDEO_MEETING).assertEqual(2);
        expect(result.VIDEO_LIVE).assertEqual(3);
        done();
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPipControlGroupEnum
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPCONTROLGROUP_ENUM_0100
     * @tc.desc   PictureInPicture_PipControlGroup 枚举值校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipControlGroupEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipControlGroupEnum';
      try{
        let result = testNapi.testPipControlGroupEnum();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPipControlTypeEnum
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPCONTROLTYPE_ENUM_0100
     * @tc.desc   PictureInPicture_PipControlType 枚举值校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipControlTypeEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipControlTypeEnum';
      try{
        let result = testNapi.testPipControlTypeEnum();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPipControlStatusEnum
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPCONTROLSTATUS_ENUM_0100
     * @tc.desc   PictureInPicture_PipControlStatus枚举值校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipControlStatusEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipControlStatusEnum';
      try{
        let result = testNapi.testPipControlTypeEnum();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testCreatePip
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_0100
     * @tc.desc   验证创建画中画控制器	OH_PictureInPicture_CreatePip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testCreatePip';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testCreatePip(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testCreatePip_ControllerId_Nullptr
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_ERRORCODE_0100
     * @tc.desc   验证创建画中画控制器,controllerid传nullptr报错误码1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePip_ControllerId_Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testCreatePip_ControllerId_Nullptr';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testCreatePip_ControllerId_Nullptr(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(1300016);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testCreatePip_SetPipMainWindowId_Zero
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_ERRORCODE_0200
     * @tc.desc   OH_PictureInPicture_SetPipMainWindowId时窗口id传0，CREATEPIP时会报1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePip_SetPipMainWindowId_Zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testCreatePip_SetPipMainWindowId_Zero';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testCreatePip_SetPipMainWindowId_Zero(0);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(1300016);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testCreatePip_SetErrPipTemplateType
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_ERRORCODE_0300
     * @tc.desc   创建画中画控制器时，通话模板传视频的控件，创建画中画报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePip_SetErrPipTemplateType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testCreatePip_SetErrPipTemplateType';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testCreatePip_SetErrPipTemplateType(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(1300016);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testStartStopPip
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_STARTPIP_0100
     * @tc.desc   验证开启、关闭画中画
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartStopPip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testStartStopPip';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testStartStopPip(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testStartPipRepeat
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_STARTPIP_ERRORCODE_0100
     * @tc.desc   验证画中画重复开启报1300015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartPipRepeat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testStartPipRepeat';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testStartPipRepeat(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(1300015);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testStopPipRepeat
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_STOPPIP_ERRORCODE_0100
     * @tc.desc   验证画中画重复关闭报1300012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStopPipRepeat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testStopPipRepeat';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testStopPipRepeat(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801 || result === 1300015) {
          done()
        } else {
          expect(result).assertEqual(1300012);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testDeletePipWithStopPip
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_DELETEPIP_0100
     * @tc.desc   验证画中画关闭后可以删除控制器
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePipWithStopPip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testDeletePipWithStopPip';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testDeletePipWithStopPip(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testDeletePipWithoutStopPip
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_DELETEPIP_0200
     * @tc.desc   验证画中画未关闭删除控制器报错误码1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeletePipWithoutStopPip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testDeletePipWithoutStopPip';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testDeletePipWithoutStopPip(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(1300016);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUpdatePipContentSize
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_UPDATE_CONTENTSIZE_0100
     * @tc.desc   验证动态更新画中画尺寸
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdatePipContentSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUpdatePipContentSize';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUpdatePipContentSize(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUpdatePipContentStatus
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_UPDATE_PIP_CONTROLSTATUS_0100
     * @tc.desc   更新画中画控件功能状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdatePipContentStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUpdatePipContentStatus';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUpdatePipContentStatus(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUpdatePipContentEnabled
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_SET_PIPCONTROLENABLED_0100
     * @tc.desc   设置画中画功能键开启/禁用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdatePipContentEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUpdatePipContentEnabled';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUpdatePipContentEnabled(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testRegisterStartPipCallback
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0100
     * @tc.desc   注册画中画启动回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterStartPipCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testRegisterStartPipCallback';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testRegisterStartPipCallback(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testTwoRegisterStartPipCallback
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0200
     * @tc.desc   注册两个画中画启动回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTwoRegisterStartPipCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testTwoRegisterStartPipCallback';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testTwoRegisterStartPipCallback(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterStartPipCallback
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0300
     * @tc.desc   注册两个画中画启动回调，取消其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterStartPipCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testUnregisterStartPipCallback';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterStartPipCallback(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterAllStartPipCallbacks
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0400
     * @tc.desc   注册两个画中画启动回调，取消所有回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnregisterAllStartPipCallbacks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnregisterAllStartPipCallbacks';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterAllStartPipCallbacks(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testRegisterResizeListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0100
     * @tc.desc   注册画中画尺寸变化回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterResizeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testRegisterResizeListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testRegisterResizeListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testTwoRegisterResizeListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0200
     * @tc.desc   注册两个画中画尺寸变化回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTwoRegisterResizeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testTwoRegisterResizeListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testTwoRegisterResizeListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterResizeListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0300
     * @tc.desc   注册两个画中画尺寸变化回调，取消其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnregisterResizeListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testUnregisterResizeListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterResizeListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterAllResizeListeners
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0400
     * @tc.desc   注册两个画中画尺寸变化回调，取消所有回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnregisterAllResizeListeners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnregisterAllResizeListeners';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterAllResizeListeners(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testRegisterControlEventListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERCONTROLEVENTLISTENER_0100
     * @tc.desc   注册画中画控件状态变化回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterControlEventListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testRegisterControlEventListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testRegisterControlEventListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterControlEventListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERCONTROLEVENTLISTENER_0200
     * @tc.desc   注册两个画中画控件状态变化回调，取消其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnregisterControlEventListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnregisterControlEventListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterControlEventListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterAllControlEventListeners
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERCONTROLEVENTLISTENER_0300
     * @tc.desc   注册两个控件状态变化回调、取消全部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnregisterAllControlEventListeners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnregisterAllControlEventListeners';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterAllControlEventListeners(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testRegisterLifeCycleListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0100
     * @tc.desc   注册画中画生命周期回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterLifeCycleListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testRegisterLifeCycleListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testRegisterLifeCycleListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testTwoRegisterLifeCycleListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0200
     * @tc.desc   注册两个画中画生命周期回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTwoRegisterLifeCycleListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testTwoRegisterLifeCycleListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testTwoRegisterLifeCycleListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterLifeCycleListener
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0300
     * @tc.desc   注册两个画中画生命周期回调，取消其中一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnregisterLifeCycleListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnregisterLifeCycleListener';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterLifeCycleListener(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnregisterAllLifeCycleListeners
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0400
     * @tc.desc   注册两个画中画生命周期回调，取消所有回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnregisterAllLifeCycleListeners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnregisterAllLifeCycleListeners';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnregisterAllLifeCycleListeners(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetPipInitialSurfaceRect
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_SET_INITIAL_RECT_0100
     * @tc.desc   设置画中画启动动画初始位置和大小
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPipInitialSurfaceRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testSetPipInitialSurfaceRect';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testSetPipInitialSurfaceRect(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetPipInitialSurfaceRectwithInvalidWidth
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_SET_INITIAL_RECT_ERRORCODE_0100
     * @tc.desc   设置画中画启动动画初始位置和大小错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPipInitialSurfaceRectwithInvalidWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = 'testSetPipInitialSurfaceRectwithInvalidWidth';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testSetPipInitialSurfaceRectwithInvalidWidth(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(1300016);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testUnsetPipInitialSurfaceRect
     * @tc.number SUB_BASIC_WMS_WINDOW_PIP_NDK_UNSET_INITIAL_RECT_ERRORCODE_0100
     * @tc.desc   取消设置画中画启动动画初始位置和大小
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnsetPipInitialSurfaceRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testUnsetPipInitialSurfaceRect';
      try{
        let mainWindow = windowStage.getMainWindowSync();
        let properties = mainWindow.getWindowProperties();
        console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
        let mainWindowId = properties.id;
        console.log(`${caseName} mainWindowId: ${JSON.stringify(mainWindowId)}`);
        let result = testNapi.testUnsetPipInitialSurfaceRect(mainWindowId);
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        if (result === 801) {
          done()
        } else {
          expect(result).assertEqual(0);
          done();
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testPipSetParentWindowIdwithNonExistedWindowId
     * @tc.number SUB_BASIC_WMS_PIP_NDK_SETPARENTWIDNOWID_ERRCODE_1300016_0100
     * @tc.desc   testPipSetParentWindowIdwithNonExistedWindowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipSetParentWindowIdwithNonExistedWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipSetParentWindowIdwithNonExistedWindowId';
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try{
        pipController = await pipWindow.create(config);
        if (!pipController.isPiPSupported()) {
          done()
        } else {
          let result = testNapi.testPipSetParentWindowIdwithNonExistedWindowId(10000);
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          if (result === 801) {
            done()
          } else {
            expect(result).assertEqual(1300016);
            done();
          }
        }
      } catch (err) {
        console.error(`${caseName} error: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   testPipSetParentWindowId
     * @tc.number SUB_BASIC_WMS_PIP_NDK_SETPARENTWIDNOWID_0100
     * @tc.desc   testPipSetParentWindowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipSetParentWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipSetParentWindowId';
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      let subWindowClass: window.Window | undefined;
      try {
        pipController = await pipWindow.create(config)
        console.log(caseName + ' www data startPiP_Function_Promise begin')
        subWindowClass = await windowStage.createSubWindow('testPipSetParentWindowId');
        let subId = subWindowClass.getWindowProperties().id;
        console.log(caseName + ' subWindowClass id: ' + subId)
        let promise = pipController.startPiP();
        promise.then(async () => {
          console.log(caseName + ' www data Succeeded in starting pip')
          let result = testNapi.testPipSetParentWindowId(subId);
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          if (result==801) {
            await subWindowClass?.destroyWindow()
            done();
          } else {
            expect(result).assertEqual(1300016);
            await pipController?.stopPiP();
            await subWindowClass?.destroyWindow()
            done();
          }
        }).catch(async (err:BusinessError) => {
          console.log(caseName + ' www data Failed1 to start pip. Cause:' +
              JSON.stringify(err.code)+':msg:'+JSON.stringify(err.message));
          expect().assertFail();
          await subWindowClass?.destroyWindow()
          done();
        });
      } catch (error) {
        console.log(caseName + ' www data Failed2 to start pip. Cause:' +
            JSON.stringify(error.code)+':msg:'+JSON.stringify(error.message));
        await subWindowClass?.destroyWindow()
        if(error.code == 801){
          expect(error.message!=null).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testPipSetParentMainWindowId
     * @tc.number SUB_BASIC_WMS_PIP_NDK_SETPARENTWIDNOWID_0200
     * @tc.desc   testPipSetParentMainWindowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipSetParentMainWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'testPipSetParentMainWindowId';
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      let WindowClass: window.Window | undefined;
      try {
        pipController = await pipWindow.create(config)
        console.log(caseName + ' www data startPiP_Function_Promise begin')
        WindowClass = windowStage.getMainWindowSync();
        let WindId = WindowClass.getWindowProperties().id;
        console.log(caseName + ' WindowClass WindId: ' + WindId)
        let promise = pipController.startPiP();
        promise.then(async () => {
          console.log(caseName + ' www data Succeeded in starting pip')
          let result = testNapi.testPipSetParentWindowId(WindId);
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          if (result==801) {
            done();
          } else {
            expect(result).assertEqual(OK);
            await pipController?.stopPiP();
            done();
          }
        }).catch(async (err:BusinessError) => {
          console.log(caseName + ' www data Failed1 to start pip. Cause:' +
              JSON.stringify(err.code)+':msg:'+JSON.stringify(err.message));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.log(caseName + ' www data Failed2 to start pip. Cause:' +
            JSON.stringify(error.code)+':msg:'+JSON.stringify(error.message));
        if(error.code == 801){
          expect(error.message!=null).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testPictureInPicture_PipState_enum
     * @tc.number SUB_PictureInPicture_PipState_0100
     * @tc.desc   testPictureInPicture_PipState_enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPictureInPicture_PipState_enum', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPictureInPicture_PipState_enum ';
      try {
        console.info(`${caseName} start`);
        let Result: number = testNapi.testPictureInPicture_PipState_enum();
        console.info(`${caseName} Result: ${Result}`);
        expect(Result).assertEqual(0);
        done()
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(err);
        done()
      }
    })

  })
}