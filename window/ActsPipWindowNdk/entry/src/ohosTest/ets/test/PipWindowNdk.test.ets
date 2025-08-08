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

export default function PipWindowNdkTest() {
  describe('ActsPipWindowNdkTest', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPTEMPLATETYPE_ENUM_0100
     * @tc.name      : testPipTemplateTypeEnum
     * @tc.desc      : PictureInPicture_PipTemplateType枚举值校验
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPCONTROLGROUP_ENUM_0100
     * @tc.name      : testPipControlGroupEnum
     * @tc.desc      : PictureInPicture_PipControlGroup 枚举值校验
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPCONTROLTYPE_ENUM_0100
     * @tc.name      : testPipControlTypeEnum
     * @tc.desc      : PictureInPicture_PipControlType 枚举值校验
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_PIPCONTROLSTATUS_ENUM_0100
     * @tc.name      : testPipControlStatusEnum
     * @tc.desc      : PictureInPicture_PipControlStatus枚举值校验
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_0100
     * @tc.name      : testCreatePip
     * @tc.desc      : 验证创建画中画控制器	OH_PictureInPicture_CreatePip
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_ERRORCODE_0100
     * @tc.name      : testCreatePip_ControllerId_Nullptr
     * @tc.desc      : 验证创建画中画控制器,controllerid传nullptr报错误码1300016
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_ERRORCODE_0200
     * @tc.name      : testCreatePip_SetPipMainWindowId_Zero
     * @tc.desc      : OH_PictureInPicture_SetPipMainWindowId时窗口id传0，CREATEPIP时会报1300016
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_CREATEPIP_ERRORCODE_0300
     * @tc.name      : testCreatePip_SetErrPipTemplateType
     * @tc.desc      : 创建画中画控制器时，通话模板传视频的控件，创建画中画报错
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_STARTPIP_0100
     * @tc.name      : testStartStopPip
     * @tc.desc      : 验证开启、关闭画中画
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_STARTPIP_ERRORCODE_0100
     * @tc.name      : testStartPipRepeat
     * @tc.desc      : 验证画中画重复开启报1300015
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_STOPPIP_ERRORCODE_0100
     * @tc.name      : testStopPipRepeat
     * @tc.desc      : 验证画中画重复关闭报1300012
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_DELETEPIP_0100
     * @tc.name      : testDeletePipWithStopPip
     * @tc.desc      : 验证画中画关闭后可以删除控制器
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_DELETEPIP_0200
     * @tc.name      : testDeletePipWithoutStopPip
     * @tc.desc      : 验证画中画未关闭删除控制器报错误码1300016
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_UPDATE_CONTENTSIZE_0100
     * @tc.name      : testUpdatePipContentSize
     * @tc.desc      : 验证动态更新画中画尺寸
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_UPDATE_PIP_CONTROLSTATUS_0100
     * @tc.name      : testUpdatePipContentStatus
     * @tc.desc      : 更新画中画控件功能状态
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_SET_PIPCONTROLENABLED_0100
     * @tc.name      : testUpdatePipContentEnabled
     * @tc.desc      : 设置画中画功能键开启/禁用
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0100
     * @tc.name      : testRegisterStartPipCallback
     * @tc.desc      : 注册画中画启动回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0200
     * @tc.name      : testTwoRegisterStartPipCallback
     * @tc.desc      : 注册两个画中画启动回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0300
     * @tc.name      : testUnregisterStartPipCallback
     * @tc.desc      : 注册两个画中画启动回调，取消其中一个
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSTARTPIP_0400
     * @tc.name      : testUnregisterAllStartPipCallbacks
     * @tc.desc      : 注册两个画中画启动回调，取消所有回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0100
     * @tc.name      : testRegisterResizeListener
     * @tc.desc      : 注册画中画尺寸变化回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0200
     * @tc.name      : testTwoRegisterResizeListener
     * @tc.desc      : 注册两个画中画尺寸变化回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0300
     * @tc.name      : testUnregisterResizeListener
     * @tc.desc      : 注册两个画中画尺寸变化回调，取消其中一个
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERSIZELISTENER_0400
     * @tc.name      : testUnregisterAllResizeListeners
     * @tc.desc      : 注册两个画中画尺寸变化回调，取消所有回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERCONTROLEVENTLISTENER_0100
     * @tc.name      : testRegisterControlEventListener
     * @tc.desc      : 注册画中画控件状态变化回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERCONTROLEVENTLISTENER_0200
     * @tc.name      : testUnregisterControlEventListener
     * @tc.desc      : 	注册两个画中画控件状态变化回调，取消其中一个
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERCONTROLEVENTLISTENER_0300
     * @tc.name      : testUnregisterAllControlEventListeners
     * @tc.desc      : 注册两个控件状态变化回调、取消全部
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0100
     * @tc.name      : testRegisterLifeCycleListener
     * @tc.desc      : 注册画中画生命周期回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0200
     * @tc.name      : testTwoRegisterLifeCycleListener
     * @tc.desc      : 注册两个画中画生命周期回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0300
     * @tc.name      : testUnregisterLifeCycleListener
     * @tc.desc      : 注册两个画中画生命周期回调，取消其中一个
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_REGISTERLIFECIRCLE_0400
     * @tc.name      : testUnregisterAllLifeCycleListeners
     * @tc.desc      : 注册两个画中画生命周期回调，取消所有回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_SET_INITIAL_RECT_0100
     * @tc.name      : testSetPipInitialSurfaceRect
     * @tc.desc      : 设置画中画启动动画初始位置和大小
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_SET_INITIAL_RECT_ERRORCODE_0100
     * @tc.name      : testSetPipInitialSurfaceRectwithInvalidWidth
     * @tc.desc      : 设置画中画启动动画初始位置和大小错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_PIP_NDK_UNSET_INITIAL_RECT_ERRORCODE_0100
     * @tc.name      : testUnsetPipInitialSurfaceRect
     * @tc.desc      : 取消设置画中画启动动画初始位置和大小
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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

  })
}