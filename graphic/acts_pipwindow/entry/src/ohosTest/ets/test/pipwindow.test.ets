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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { UiDriver, BY, ON, PointerMatrix, Driver, Point } from '@ohos.UiTest'
import pipWindow from '@ohos.PiPWindow';
import { typeNode } from '@ohos.arkui.node';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { TextNodeController } from './CustomNode.test';
import settings from '@ohos.settings';

// let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

export default function pipWindowTest(context1: common.BaseContext, windowStage: ohosWindow.WindowStage) {
  describe('window_pipWindow_test', () => {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;
    let tag = 'pipWindowTest'
    let isAutoWindow: string =
      settings.getValueSync(globalThis.abilityContext, 'window_pcmode_switch_status', '',
        settings.domainName.DEVICE_SHARED);
    let isPCStatus: string = settings.getValueSync(globalThis.abilityContext, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY);
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    let sleep = async (time:number):Promise<void> => {
      let timeoutId:number | null = null;
      await new Promise((resolve: (value: string) => void) => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      });
      clearTimeout(timeoutId)
    }

    let initConfig = (PiPTemplateType: pipWindow.PiPTemplateType):pipWindow.PiPConfiguration => {
      let config: pipWindow.PiPConfiguration;
      config = {
        context: globalThis.abilityContext,
        componentController: new XComponentController(),
        templateType: PiPTemplateType,
        contentWidth: 400,
        contentHeight: 600,
      };
      return config;
    }

    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name       : isPiPEnabled_test
     * @tc.desc       : To test the function of isPiPEnabled
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level0
     */
    it('isPiPEnabled_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.log('www data isPiPEnabled_test begin')
      try {
        let enable = pipWindow.isPiPEnabled();
        console.info('isPipEnabled:' + enable);
        console.log('www data Succeeded in isPipEnabled ' + enable)
        expect(enable != null).assertTrue();
        done();
      } catch (error) {
        console.log('www data Succeeded in isPipEnabled ' + error)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name       : create_Function_Promise
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err));
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' +JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name       : startPiP_Function_Promise
     * @tc.desc       : To test the function of startPiP
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('startPiP_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        console.log('www data startPiP_Function_Promise begin')
        let promise = pipController.startPiP();
        promise.then(() => {
          console.log('www data Succeeded in starting pip')
          expect(true).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log('www data Failed1 to start pip. Cause:' +JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.log('www data Failed2 to start pip. Cause:' +JSON.stringify(error));
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.name       : stopPiP_Function_Promise
     * @tc.desc       : To test the function of stopPiP
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('stopPiP_Function_Promise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        console.log('www data stopPiP_Function_Promise begin ')
        await pipController.startPiP()
        let promise = pipController.stopPiP()
        promise.then(() => {
          console.log('www data Succeeded in stopping pip')
          expect(true).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          if (err.code == 1300015) {
            console.log('www data window is stopping:'+ JSON.stringify(err))
            expect(true).assertTrue()
            done()
          } else {
            console.log('www data Failed1 to stop pip in stopPiP . Cause:' + JSON.stringify(err))
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed2 to stop pip. Cause:' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.name       : setAutoStartEnabled_test
     * @tc.desc       : To test the function of setAutoStartEnabled
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('setAutoStartEnabled_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data setAutoStartEnabled_test begin')
        let enable = true;
        pipController.setAutoStartEnabled(enable);
        console.log('www data Succeeded in setAutoStartEnabled_test')
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('www data Failed to setAutoStartEnabled_test' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.name       : updateContentSize_test
     * @tc.desc       : To test the function of updateContentSize
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('updateContentSize_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data updateContentSize_test begin');
        let width = 540;
        let height = 960;
        pipController.updateContentSize(width, height);
        console.log('www data Succeeded in updateContentSize_test');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('www data Failed to updateContentSize_test' + JSON.stringify(error));
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.name       : stateChange_Function_Callback
     * @tc.desc       : To test the function of stateChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('stateChange_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data stateChange_Function_ Callback begin');
        pipController.on('stateChange', (state, reason) => {
          let curState = '';
          switch (state) {
            case pipWindow.PiPState.ABOUT_TO_START:
              curState = 'ABOUT_TO_START';
              break;
            case pipWindow.PiPState.STARTED:
              curState = 'STARTED';
              break;
            case pipWindow.PiPState.ABOUT_TO_STOP:
              curState = 'ABOUT_TO_STOP';
              break;
            case pipWindow.PiPState.STOPPED:
              curState = 'STOPPED';
              break;
            case pipWindow.PiPState.ABOUT_TO_RESTORE:
              curState = 'ABOUT_TO_RESTORE';
              break;
            case pipWindow.PiPState.ERROR:
              curState = 'ERROR';
              break;
            default:
              break;
          }
          console.info('stateChange:' + curState + ' reason:' + reason);
          console.log('www data Succeeded in stateChange_Function_ Callback' + curState)
          console.log('www data Succeeded in stateChange_Function_ Callback' + reason)
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('www data Failed to stateChange_Function_ Callback' + JSON.stringify(err));
        if(err.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name       : stateChange_test
     * @tc.desc       : To test the function of stateChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('stateChange_test',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data stateChange_test begin');
        pipController.on('stateChange', (state, reason) => {
          let curState = '';
          switch (state) {
            case pipWindow.PiPState.ABOUT_TO_START:
              curState = 'ABOUT_TO_START';
              break;
            case pipWindow.PiPState.STARTED:
              curState = 'STARTED';
              break;
            case pipWindow.PiPState.ABOUT_TO_STOP:
              curState = 'ABOUT_TO_STOP';
              break;
            case pipWindow.PiPState.STOPPED:
              curState = 'STOPPED';
              break;
            case pipWindow.PiPState.ABOUT_TO_RESTORE:
              curState = 'ABOUT_TO_RESTORE';
              break;
            case pipWindow.PiPState.ERROR:
              curState = 'ERROR';
              break;
            default:
              break;
          }
          console.log('www data Succeeded in stateChange_Function_ Callback' + curState)
          console.log('www data Succeeded in stateChange_Function_ Callback' + reason)
        });
        try {
          pipController.off('stateChange');
          console.log('www data Succeeded in stateChange_test')
          expect(true).assertTrue();
          done()
        } catch (error) {
          console.log('www data Failed1 to stateChange_test' + JSON.stringify(error))
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.log('www data Failed2 to stateChange_test' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name       : controlPanelActionEvent_Function_Callback
     * @tc.desc       : To test the function of controlPanelActionEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('controlPanelActionEvent_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data controlPanelActionEvent_Function_Callback begin');
        pipController.on('controlPanelActionEvent', (event) => {
          switch (event) {
            case 'playbackStateChanged':
              break;
            case 'nextVideo':
              break;
            case 'previousVideo':
              break;
            default:
              break;
          }
          console.info('registerActionEventCallback, event:' + event);
          console.log('www data Succeeded in registerActionEventCallback , event:' + event)
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('www data Failed to registerActionEventCallback , event:' + JSON.stringify(error));
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.name       : controlPanelActionEvent_test
     * @tc.desc       : To test the function of controlPanelActionEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('controlPanelActionEvent_test',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('www data controlPanelActionEvent_test begin');
        pipController.on('controlPanelActionEvent', (event) => {
          switch (event) {
            case 'playbackStateChanged':
              break;
            case 'nextVideo':
              break;
            case 'previousVideo':
              break;
            default:
              break;
          }
          console.log('www data Succeeded in registerActionEventCallback , event:' + event)
        });
        try {
          pipController.off('controlPanelActionEvent');
          console.log('www data Succeeded in controlPanelActionEvent_test')
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.log('www data Failed1 to controlPanelActionEvent_test' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.log('www data Failed2 to registerActionEventCallback , event:' + JSON.stringify(error))
        if(error.code == 801){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.name       : testPiPTemplateType
     * @tc.desc       : To test the function of testPiPTemplateType
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level0
     */
    it('testPiPTemplateType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let msg = "testPiPTemplateType"
      try {
        expect(pipWindow.PiPTemplateType.VIDEO_PLAY).assertEqual(0);
        expect(pipWindow.PiPTemplateType.VIDEO_CALL).assertEqual(1);
        expect(pipWindow.PiPTemplateType.VIDEO_MEETING).assertEqual(2);
        expect(pipWindow.PiPTemplateType.VIDEO_LIVE).assertEqual(3);
        done()
      } catch (error) {
        expect().assertFail()
        done()
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.name       : testPiPEvent
     * @tc.desc       : To test the function of testPiPEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testPiPEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testPiPEvent"
      try {
        let event: pipWindow.PiPActionEventType = "playbackStateChanged";
        let event2: pipWindow.PiPVideoActionEvent = "playbackStateChanged";
        let event3: pipWindow.PiPCallActionEvent = "hangUp";
        let event4: pipWindow.PiPMeetingActionEvent = "hangUp";
        let event5: pipWindow.PiPLiveActionEvent = "playbackStateChanged";
        expect(pipWindow.PiPState.ABOUT_TO_START).assertEqual(1);
        expect(pipWindow.PiPState.STARTED).assertEqual(2);
        expect(pipWindow.PiPState.ABOUT_TO_STOP).assertEqual(3);
        expect(pipWindow.PiPState.STOPPED).assertEqual(4);
        expect(pipWindow.PiPState.ABOUT_TO_RESTORE).assertEqual(5);
        expect(pipWindow.PiPState.ERROR).assertEqual(6);
        done();
      } catch (error) {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.name       : create_Function_Promise_2
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err));
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.name       : create_Function_Promise_3
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err));
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.name       : create_Function_Promise_4
     * @tc.desc       : To test the function of create
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('create_Function_Promise_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err))
          if(err.code == 801){
            expect(true).assertTrue();
            done();
          } else{
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed2 to create pip controller. Cause' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1600
     * @tc.name       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
     * @tc.desc       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1700
     * @tc.name       : test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
     * @tc.desc       : test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1800
     * @tc.name       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD
     * @tc.desc       : test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT,pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(false).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD Failed. Cause` + JSON.stringify(error) + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1900
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2000
     * @tc.name       : test_VideoCallControlGroup_HANG_UP_BUTTON
     * @tc.desc       : test_VideoCallControlGroup_HANG_UP_BUTTON
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_HANG_UP_BUTTON begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2100
     * @tc.name       : test_VideoCallControlGroup_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2200
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH,pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2300
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH,pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2400
     * @tc.name       : test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.HANG_UP_BUTTON,pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2500
     * @tc.name       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.desc       : test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH,pipWindow.VideoCallControlGroup.HANG_UP_BUTTON,pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2600
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2700
     * @tc.name       : test_VideoMeetingControlGroup_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2800
     * @tc.name       : test_VideoMeetingControlGroup_MUTE_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_MUTE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_MUTE_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_MUTE_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2900
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON,pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3000
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON,pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3100
     * @tc.name       : test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.MUTE_SWITCH,pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3200
     * @tc.name       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.desc       : test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH begin');
      let pipController:pipWindow.PiPController| undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups:[pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON,pipWindow.VideoMeetingControlGroup.MUTE_SWITCH,pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err));
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3300
     * @tc.name       : TestUpdatePiPControlStatusInVideoPlay
     * @tc.desc       : TestUpdatePiPControlStatusInVideoPlay
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestUpdatePiPControlStatusInVideoPlay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestUpdatePiPControlStatusInVideoPlay';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            let count = 0;
            pipController.on('controlPanelActionEvent', (event: pipWindow.PiPActionEventType, status?: number) => {
              switch (event) {
                case 'playbackStateChanged':
                  if (status === 0) {
                    count--;
                  } else if (status === 1) {
                    count++;
                  }
                  break;
                default:
                  break;
              }
            })
            try {
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PLAY);
              console.info(`${message} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PLAY`);
              await sleep(1000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PAUSE);
              console.info(`${message} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PAUSE`);

              console.info(`${message} count is：${count}`);
              expect(0).assertEqual(count);
              pipController.off('controlPanelActionEvent');
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);
                expect(true).assertTrue();
                done();
              } else{
                console.error(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });

        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3400
     * @tc.name       : TestUpdatePiPControlStatelessType
     * @tc.desc       : TestUpdatePiPControlStatelessType
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestUpdatePiPControlStatelessType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestUpdatePiPControlStatelessType';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            try {
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.FAST_FORWARD, pipWindow.PiPControlStatus.PLAY);
              await sleep(1000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.FAST_BACKWARD, pipWindow.PiPControlStatus.PAUSE);

              pipController.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PREVIOUS, pipWindow.PiPControlStatus.PLAY);
              await sleep(1000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_NEXT, pipWindow.PiPControlStatus.PAUSE);

              await sleep(1000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.HANG_UP_BUTTON, pipWindow.PiPControlStatus.PAUSE);

              expect(true).assertTrue();
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);
                expect(true).assertTrue();
                done();
              } else{
                console.error(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3500
     * @tc.name       : TestUpdatePiPControlStatusInVideoCall
     * @tc.desc       : TestUpdatePiPControlStatusInVideoCall
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestUpdatePiPControlStatusInVideoCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestUpdatePiPControlStatusInVideoCall';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_CALL);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            let count = 0;
            pipController.on('controlPanelActionEvent', (event: pipWindow.PiPActionEventType, status?: number) => {
              switch (event) {
                case 'videoStateChanged':
                  if (status === 0) {
                    count--;
                  } else if (status === 1) {
                    count++;
                  }
                  break;
                default:
                  break;
              }
            })
            try {
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.OPEN);
              console.info(`${message} Succeeded updatePiPControlStatus CAMERA_SWITCH to OPEN`);
              await sleep(2000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.CLOSE);
              console.info(`${message} Succeeded updatePiPControlStatus CAMERA_SWITCH to CLOSE`);

              console.info(`${message} count is：${count}`);
              expect(0).assertEqual(count);
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);
                expect(true).assertTrue();
                done();
              } else{
                console.info(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3600
     * @tc.name       : TestUpdatePiPControlStatusInVideoMeeting
     * @tc.desc       : TestUpdatePiPControlStatusInVideoMeeting
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestUpdatePiPControlStatusInVideoMeeting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestUpdatePiPControlStatusInVideoMeeting';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_MEETING);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            let count = 0;
            pipController.on('controlPanelActionEvent', (event: pipWindow.PiPActionEventType, status?: number) => {
              switch (event) {
                case 'videoStateChanged':
                  if (status === 0) {
                    count--;
                  } else if (status === 1) {
                    count++;
                  }
                  break;
                default:
                  break;
              }
            })
            try {
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.OPEN);
              console.info(`${message} Succeeded updatePiPControlStatus CAMERA_SWITCH to OPEN`);
              await sleep(2000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.CAMERA_SWITCH, pipWindow.PiPControlStatus.CLOSE);
              console.info(`${message} Succeeded updatePiPControlStatus CAMERA_SWITCH to CLOSE`);

              console.info(`${message} count is：${count}`);
              expect(0).assertEqual(count);
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);
                expect(true).assertTrue();
                done();
              } else{
                console.error(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message}} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });

        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3700
     * @tc.name       : TestUpdatePiPControlStatusInVideoLive
     * @tc.desc       : TestUpdatePiPControlStatusInVideoLive
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestUpdatePiPControlStatusInVideoLive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestUpdatePiPControlStatusInVideoLive';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_LIVE);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            let count = 0;
            pipController.on('controlPanelActionEvent', (event: pipWindow.PiPActionEventType, status?: number) => {
              switch (event) {
                case 'playbackStateChanged':
                  if (status === 0) {
                    count--;
                  } else if (status === 1) {
                    count++;
                  }
                  break;
                default:
                  break;
              }
            })
            try {
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PLAY);
              console.info(`${message} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PLAY`);
              await sleep(2000);
              pipController.updatePiPControlStatus(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, pipWindow.PiPControlStatus.PAUSE);
              console.info(`${message} Succeeded updatePiPControlStatus VIDEO_PLAY_PAUSE to PAUSE`);

              console.info(`${message} count is：${count}`);
              expect(0).assertEqual(count);
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);
                expect(true).assertTrue();
                done();
              } else{
                console.info(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3800
     * @tc.name       : TestSetPiPControlEnabledInVideoPlay
     * @tc.desc       : TestSetPiPControlEnabledInVideoPlay
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestSetPiPControlEnabledInVideoPlay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestSetPiPControlEnabledInVideoPlay';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            try {
              pipController.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, false);
              console.info(`${message} Succeeded setPiPControlEnabled VIDEO_PLAY_PAUSE false`);
              await sleep(1000);
              pipController.setPiPControlEnabled(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE, true);
              console.info(`${message} Succeeded setPiPControlEnabled VIDEO_PLAY_PAUSE true`);
              expect(true).assertTrue();
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to setPiPControlEnabled`);
                expect(true).assertTrue();
                done();
              } else{
                console.info(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3900
     * @tc.name       : TestSetPiPControlEnabledInVideoCall
     * @tc.desc       : TestSetPiPControlEnabledInVideoCall
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestSetPiPControlEnabledInVideoCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestSetPiPControlEnabledInVideoCall';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_CALL);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            try {
              pipController.setPiPControlEnabled(pipWindow.PiPControlType.MICROPHONE_SWITCH, false);
              console.info(`${message} Succeeded setPiPControlEnabled MICROPHONE_SWITCH false`);
              await sleep(1000);
              pipController.setPiPControlEnabled(pipWindow.PiPControlType.MICROPHONE_SWITCH, true);
              console.info(`${message} Succeeded setPiPControlEnabled MICROPHONE_SWITCH true`);
              expect(true).assertTrue();
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to setPiPControlEnabled`);
                expect(true).assertTrue();
                done();
              } else{
                console.info(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4000
     * @tc.name       : TestSetPiPControlEnabledInVideoMeeting
     * @tc.desc       : TestSetPiPControlEnabledInVideoMeeting
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('TestSetPiPControlEnabledInVideoMeeting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      const message = 'TestSetPiPControlEnabledInVideoMeeting';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_MEETING);
      let pipController: pipWindow.PiPController;
      try {
        pipWindow.create(config).then((data: pipWindow.PiPController) => {
          pipController = data;
          pipController.startPiP().then(async () => {
            try {
              pipController.setPiPControlEnabled(pipWindow.PiPControlType.MUTE_SWITCH, false);
              console.info(`${message} Succeeded setPiPControlEnabled MUTE_SWITCH false`);
              await sleep(1000);
              pipController.setPiPControlEnabled(pipWindow.PiPControlType.MUTE_SWITCH, true);
              console.info(`${message} Succeeded setPiPControlEnabled MUTE_SWITCH true`);
              expect(true).assertTrue();
              done();
            } catch (error) {
              if(error.code == 801){
                console.info(`${message} The current device type does not support to setPiPControlEnabled`);
                expect(true).assertTrue();
                done();
              } else{
                console.info(`${message} Params error. Cause` + JSON.stringify(error));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if(err.code == 801){
              console.info(`${message} The current device type does not support to start pip`);
              expect(true).assertTrue();
              done();
            } else{
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4100
     * @tc.name       : testPiPControlCustomUI
     * @tc.desc       : testPiPControlCustomUI
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testPiPControlCustomUI', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.log(`${tag} testPiPControlCustomUI begin`);
      const message = 'testPiPControlCustomUI';
      let nodeController: TextNodeController = new TextNodeController('this is custom UI');
      let config: pipWindow.PiPConfiguration = {
        context: globalThis.abilityContext,
        componentController: new XComponentController(),
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: 400,
        contentHeight: 600,
        customUIController: nodeController
      };
      try {
        pipWindow.create(config).then(async (data: pipWindow.PiPController) => {
          console.log(`${message}} Succeeded to creat pip controller. PiPControllerData：${data}`)
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to create pipController`);
            expect(true).assertTrue();
            done();
          } else{
            console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if(error.code == 801){
          console.info(`${message} The current device type does not support to create pipController`);
          expect(true).assertTrue();
          done();
        } else{
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4200
     * @tc.name       : testCreateArgsContentNode
     * @tc.desc       : testCreateArgsContentNode
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCreateArgsContentNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const caseName = 'TestCreateArgsContentNode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let uiContext = windowClass.getUIContext();
        let xComponentController: XComponentController = new XComponentController();
        let xComponent = typeNode.createNode(uiContext, 'XComponent');
        xComponent.initialize({
          id:'xComponent',
          type:XComponentType.SURFACE,
          controller:xComponentController
        });
        let contentWidth: number = 800;
        let contentHeight: number = 600;
        let config: pipWindow.PiPConfiguration = {
          context: context1,
          componentController: xComponentController,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight
        };
        pipWindow.create(config, xComponent).then((data : pipWindow.PiPController) => {
          console.info(`${caseName} Succeeded in creating pip controller. Data:${data}`);
          expect(data !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          if (err.code === 801) {
            console.error(`${caseName} The current device Capability not supported.`);
            done();
          } else {
            console.error(`${caseName} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        if(exception.code == 1300002) {
          console.info(`${caseName}: This window state is abnormal.`);
          done();
        } else {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
     * @tc.name       : PiPSizeChange_Function_Callback
     * @tc.desc       : To test the function of PiPSizeChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('PiPSizeChange_Function_Callback_0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      if (isPCStatus != ''|| isAutoWindow == 'true') {
        console.log('PiPSizeChange_Function_Callback_0 device type 2in1');
        done();
        return;
      }
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let res1 = false;
      let res2 = false;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('data PiPSizeChange_Function_Callback_0 begin');
        if (!pipController.isPiPSupported()) {
          console.info('PiPSizeChange_Function_Callback_0 pip is not supported');
          expect(true).assertTrue();
          done();
        }
        pipController.on('pipWindowSizeChange', (size: pipWindow.PiPWindowSize) => {
          console.info('PiPSizeChange callback 1 size info: ' + JSON.stringify(size) + ' result: ' + res1);
          res1 = true;
        });
        pipController.on('pipWindowSizeChange', (size: pipWindow.PiPWindowSize) => {
          console.info('PiPSizeChange callback 2 size info: ' + JSON.stringify(size) + ' result: ' + res2);
          res2 = true;
        });
        let promise = pipController.startPiP();
        promise.then(() => {
          console.log('PiPSizeChange data Succeeded in starting pip');
          expect(true).assertTrue();
        }).catch((err0: BusinessError) => {
          console.log('PiPSizeChange data Failed1 to start pip. Cause:' + JSON.stringify(err0));
          expect().assertFail();
          done();
        });
        let width = 410;
        let height = 910;
        pipController.updateContentSize(width, height);
        try {
          await sleep(1000);
          expect(res1).assertEqual(true);
          expect(res2).assertEqual(true);
          console.log('PiPSizeChange Succeeded check result');
          done();
        } catch (e) {
          console.log('PiPSizeChange failed' + JSON.stringify(e));
          done();
        }
      } catch (err2) {
        console.log('data Failed0 to PiPSizeChange_test' + JSON.stringify(err2))
        if(err2.code == 801 || err2.code == 401){
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
     * @tc.name       : PiPSizeChange_Function_Callback
     * @tc.desc       : To test the function of PiPSizeChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('PiPSizeChange_Function_Callback_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      if (isPCStatus != ''|| isAutoWindow == 'true') {
        console.log('PiPSizeChange_Function_Callback_1 device type 2in1');
        done();
        return;
      }
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let res1 = false;
      let res2 = false;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('data PiPSizeChange_Function_Callback_1 begin');
        if (!pipController.isPiPSupported()) {
          console.info('PiPSizeChange_Function_Callback_0 pip is not supported');
          expect(true).assertTrue();
          done();
        }
        let callback1 = (size: pipWindow.PiPWindowSize) => {
          console.info('PiPSizeChange callback 1 size info: ' + JSON.stringify(size) + ' result: ' + res1);
          res1 = true;
        };
        let callback2 = (size: pipWindow.PiPWindowSize) => {
          console.info('PiPSizeChange callback 2 siz info: ' + JSON.stringify(size) + ' result: ' + res2);
          res2 = true;
        };
        pipController.on('pipWindowSizeChange', callback1);
        pipController.on('pipWindowSizeChange', callback2);
        pipController.off('pipWindowSizeChange', callback1);
        let promise = pipController.startPiP();
        promise.then(() => {
          console.log('PiPSizeChange data Succeeded in starting pip');
          expect(true).assertTrue();
        }).catch((err0:BusinessError) => {
          console.log('PiPSizeChange data Failed2 to start pip. Cause:' + JSON.stringify(err0));
          expect().assertFail();
          done();
        });
        let width = 420;
        let height = 920;
        pipController.updateContentSize(width, height);
        try {
          await sleep(1000);
          expect(res1).assertEqual(false);
          expect(res2).assertEqual(true);
          console.log('PiPSizeChange Succeeded check result');
          done();
        } catch (e) {
          console.log('PiPSizeChange Succeeded failed' + JSON.stringify(e));
          done();
        }
      } catch (err2) {
        console.log('data Failed2 to PiPSizeChange_test' + JSON.stringify(err2))
        if(err2.code == 801 || err2.code == 401){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
     * @tc.name       : PiPSizeChange_Function_Callback
     * @tc.desc       : To test the function of PiPSizeChange
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level3
     */
    it('PiPSizeChange_Function_Callback_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      if (isPCStatus != ''|| isAutoWindow == 'true') {
        console.log('PiPSizeChange_Function_Callback_2 device type 2in1');
        done();
        return;
      }
      let pipController:pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let res1 = false;
      let res2 = false;
      let config:pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config);
        console.log('data PiPSizeChange_Function_Callback_2 begin');
        if (!pipController.isPiPSupported()) {
          console.info('PiPSizeChange_Function_Callback_0 pip is not supported');
          expect(true).assertTrue();
          done();
        }
        let callback1 = (size: pipWindow.PiPWindowSize) => {
          console.info('PiPSizeChange callback 1 size info: ' + JSON.stringify(size) + ' result: ' + res1);
          res1 = true;
        };
        let callback2 = (size: pipWindow.PiPWindowSize) => {
          console.info('PiPSizeChange callback 2 siz info: ' + JSON.stringify(size) + ' result: ' + res2);
          res2 = true;
        };
        pipController.on('pipWindowSizeChange', callback1);
        pipController.on('pipWindowSizeChange', callback2);
        try {
          pipController.off('pipWindowSizeChange');
          console.log('PiPSizeChange data Succeeded in starting pip');
          expect(true).assertTrue();
          done()
        } catch (err0) {
          console.log('PiPSizeChange Failed to off register: ' + JSON.stringify(err0));
          expect().assertFail();
          done();
        }
        let promise = pipController.startPiP();
        promise.then(() => {
          console.log('PiPSizeChange data Succeeded in starting pip');
          expect(true).assertTrue();
        }).catch((err1:BusinessError) => {
          console.log('PiPSizeChange data Failed3 to start pip. Cause:' + JSON.stringify(err1));
          expect().assertFail();
          done();
        });
        let width = 430;
        let height = 930;
        pipController.updateContentSize(width, height);
        try {
          await sleep(1000);
          expect(res1).assertEqual(false);
          expect(res2).assertEqual(false);
          console.log('PiPSizeChange Succeeded check result');
          done();
        } catch (e) {
          console.log('PiPSizeChange Succeeded failed' + JSON.stringify(e));
          done();
        }
      } catch (err2) {
        console.log('data Failed3 to PiPSizeChange_test' + JSON.stringify(err2));
        if(err2.code == 801 || err2.code == 401){
          expect(true).assertTrue();
          done();
        } else{
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_GET_PIP_WINDOW_INFO_0100
     * @tc.name       : testgetPiPWindowInfo
     * @tc.desc       : testgetPiPWindowInfo
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testgetPiPWindowInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const caseName = 'testgetPiPWindowInfo';
      let pipWindowInfo: pipWindow.PiPWindowInfo | undefined = undefined;
      try {
        let windowClass = windowStage.getMainWindowSync();
        let pipController: pipWindow.PiPController;
        let xComponentController: XComponentController = new XComponentController();
        let uiContext = windowClass.getUIContext(); // 可传入UIContext或在布局中通过this.getUIContext()为context赋有效值
        let xComponent = typeNode.createNode(uiContext, 'XComponent');
        xComponent.initialize({
          id:'xcomponent',
          type:XComponentType.SURFACE,
          controller:xComponentController
        });
        let contentWidth: number = 800; // 假设当前内容宽度800px。
        let contentHeight: number = 600; // 假设当前内容高度600px。
        let config: pipWindow.PiPConfiguration = {
          context: context1,
          componentController: xComponentController,
          templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: contentWidth,
          contentHeight: contentHeight
        };

        let promise1 : Promise<pipWindow.PiPController> = pipWindow.create(config, xComponent);
        promise1.then((data : pipWindow.PiPController) => {
          pipController = data;
          console.info(`${caseName} Succeeded in creating pip controller. Data:${data}`);
          let promise2 : Promise<void> = pipController.startPiP();
          promise2.then(() => {
            console.info(`${caseName} Succeeded in starting pip.`);
            let promise3 : Promise<pipWindow.PiPWindowInfo> = pipController.getPiPWindowInfo();
            promise3.then((data) => {
              pipWindowInfo = data;
              console.info(caseName+' Success in get pip window info. Info windowId: ' + JSON.stringify(pipWindowInfo.windowId) +' windowSize: '+JSON.stringify(pipWindowInfo.size));
              expect(true).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} Failed to get pip window info. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: BusinessError) => {
            console.error(`${caseName} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });

        
      } catch (exception) {
        console.error(`${caseName} Failed to get pip window info. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number     : testUpdateContentSizeErrCode401_0100
     * @tc.name       : testUpdateContentSizeErrCode401_0100
     * @tc.desc       : testUpdateContentSizeErrCode401_0100
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testUpdateContentSizeErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testUpdateContentSizeErrCode401_0100';
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        try {
          pipController.updateContentSize(null, null);
          console.error(message + 'Succeeded in calling updateContentSize.');
          expect().assertFail();
          done()
        } catch (e) {
          console.log(message + 'Failed to call updateContentSize. Cause:' + JSON.stringify(e));
          if (e.code == 801) {
            console.info(message + '此设备不支持updateContentSize能力.');
          } else {
            expect(e.code).assertEqual(401);
          }
          done()
        }
      } catch (error) {
        console.log(message + 'Failed2 to call updateContentSize. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          console.info(message + '此设备不支持updateContentSize能力.');
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.number     : testUpdatePiPControlStatusErrCode401_0100
     * @tc.name       : testUpdatePiPControlStatusErrCode401_0100
     * @tc.desc       : testUpdatePiPControlStatusErrCode401_0100
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testUpdatePiPControlStatusErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testUpdatePiPControlStatusErrCode401_0100';
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        try {
          pipController.updatePiPControlStatus(null, null);
          console.error(message + 'Succeeded in calling updatePiPControlStatus.');
          expect().assertFail();
          done()
        } catch (e) {
          console.log(message + 'Failed to call updatePiPControlStatus. Cause:' + JSON.stringify(e));
          if (e.code == 801) {
            console.info(message + '此设备不支持updatePiPControlStatus能力.');
          } else {
            expect(e.code).assertEqual(401);
          }
          done()
        }
      } catch (error) {
        console.log(message + 'Failed2 to call updatePiPControlStatus. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          console.info(message + '此设备不支持updatePiPControlStatus能力.');
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.number     : testSetPiPControlEnabledErrCode401_0100
     * @tc.name       : testSetPiPControlEnabledErrCode401_0100
     * @tc.desc       : testSetPiPControlEnabledErrCode401_0100
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetPiPControlEnabledErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetPiPControlEnabledErrCode401_0100';
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        try {
          pipController.setPiPControlEnabled(null, null);
          console.error(message + 'Succeeded in calling setPiPControlEnabled.');
          expect().assertFail();
          done()
        } catch (e) {
          console.log(message + 'Failed to call setPiPControlEnabled. Cause:' + JSON.stringify(e));
          if (e.code == 801) {
            console.info(message + '此设备不支持setPiPControlEnabled能力.');
          } else {
            expect(e.code).assertEqual(401);
          }
          done()
        }
      } catch (error) {
        console.log(message + 'Failed2 to call setPiPControlEnabled. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          console.info(message + '此设备不支持setPiPControlEnabled能力.');
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.number     : testOnPipWindowSizeChangeErrCode401_0100
     * @tc.name       : testOnPipWindowSizeChangeErrCode401_0100
     * @tc.desc       : testOnPipWindowSizeChangeErrCode401_0100
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnPipWindowSizeChangeErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testOnPipWindowSizeChangeErrCode401_0100';
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        try {
          const callback = (res: pipWindow.PiPWindowSize) => {}
          pipController.on(null, callback);
          console.error(message + 'Succeeded in calling on_pipWindowSizeChange.');
          expect().assertFail();
          done()
        } catch (e) {
          console.log(message + 'Failed to call on_pipWindowSizeChange. Cause:' + JSON.stringify(e));
          if (e.code == 801) {
            console.info(message + '此设备不支持on_pipWindowSizeChange能力.');
          } else {
            expect(e.code).assertEqual(401);
          }
          done()
        }
      } catch (error) {
        console.log(message + 'Failed2 to call on_pipWindowSizeChange. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          console.info(message + '此设备不支持on_pipWindowSizeChange能力.');
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.number     : testOffPipWindowSizeChangeErrCode401_0100
     * @tc.name       : testOffPipWindowSizeChangeErrCode401_0100
     * @tc.desc       : testOffPipWindowSizeChangeErrCode401_0100
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOffPipWindowSizeChangeErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testOffPipWindowSizeChangeErrCode401_0100';
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
      };
      try {
        pipController = await pipWindow.create(config)
        try {
          const callback = (res: pipWindow.PiPWindowSize) => {}
          pipController.off(null, callback);
          console.error(message + 'Succeeded in calling off_pipWindowSizeChange.');
          expect().assertFail();
          done()
        } catch (e) {
          console.log(message + 'Failed to call off_pipWindowSizeChange. Cause:' + JSON.stringify(e));
          if (e.code == 801) {
            console.info(message + '此设备不支持off_pipWindowSizeChange能力.');
          } else {
            expect(e.code).assertEqual(401);
          }
          done()
        }
      } catch (error) {
        console.log(message + 'Failed2 to call off_pipWindowSizeChange. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          console.info(message + '此设备不支持off_pipWindowSizeChange能力.');
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.number     : testGetPiPWindowInfoErrCode1300014_0100
     * @tc.name       : testGetPiPWindowInfoErrCode1300014_0100
     * @tc.desc       : testGetPiPWindowInfoErrCode1300014_0100
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetPiPWindowInfoErrCode1300014_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testGetPiPWindowInfoErrCode1300014_0100';
      const config = initConfig(pipWindow.PiPTemplateType.VIDEO_PLAY);
      let pipController: pipWindow.PiPController | null = null;
      try {
        pipController = await pipWindow.create(config)
        pipController!.getPiPWindowInfo().then(async () => {
          console.error(`${message} Succeeded to getPiPWindowInfo.`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to getPiPWindowInfo`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
            expect(err.code).assertEqual(1300014);
            done();
          }
        });
      } catch (error) {
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to getPiPWindowInfo`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${message} Failed2 to getPiPWindowInfo. Cause` + JSON.stringify(error));
          expect().assertFail();
          done();
        }
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_ON_PIP_WINDOW_SIZE_CHANGE_0100
     * @tc.name       : test_pipWindowSizeChange
     * @tc.desc       : 验证updateContentSize后获取pipWindow宽高正确
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_pipWindowSizeChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_pipWindowSizeChange!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let pipSize: pipWindow.PiPWindowSize;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
        contentWidth: 500,
        contentHeight: 500
      };
      let callback = (size: pipWindow.PiPWindowSize) => {
        console.info(`${message} success in callback, size: ${size}`)
        pipSize = size
      }
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            await pipController.startPiP();
            await sleep(1000);
            pipController.on('pipWindowSizeChange', callback);
            pipController.updateContentSize(800, 600);
            await sleep(1000);
            let pipWindowInfo = await pipController.getPiPWindowInfo();
            let pipInfoSize = pipWindowInfo.size
            console.log(`${message} pipWindowInfo width is ${pipInfoSize.width}, pipWindowInfo height is ${pipInfoSize.height}, pipWindowInfo scale is ${pipInfoSize.scale}`)
            console.log(`${message} callback width is ${pipSize.width}, callback height is ${pipSize.height}, callback scale is ${pipSize.scale}`)
            expect(pipSize.width).assertEqual(pipInfoSize.width);
            expect(pipSize.height).assertEqual(pipInfoSize.height);
            expect(Math.abs(pipSize.scale - pipInfoSize.scale)).assertLessOrEqual(0.01)
            pipController.off('pipWindowSizeChange', callback);
            await pipController.stopPiP();
            await sleep(1000);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0100
     * @tc.name       : test_videoCallControlGroup_MUTE_SWITCH
     * @tc.desc       : 验证VIDEO_CALL仅有一个VideoCallControlGroup.MUTE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_videoCallControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_videoCallControlGroup_MUTE_SWITCH!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: 500,
        contentHeight: 500,
        controlGroups: [pipWindow.VideoCallControlGroup.MUTE_SWITCH]
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)
              expect(true).assertTrue();
            }).catch((err: BusinessError) => {
              console.error(`${message} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
              expect().assertFail();
            });
            await sleep(1000);
            await pipController.stopPiP();
            await sleep(1000);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0200
     * @tc.name       : test_VideoMeetingControlGroup_MICROPHONE_SWITCH
     * @tc.desc       : 验证VIDEO_CALL仅有一个VideoCallControlGroup.MUTE_SWITCH
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_VideoMeetingControlGroup_MICROPHONE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_VideoMeetingControlGroup_MICROPHONE_SWITCH!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: 500,
        contentHeight: 500,
        controlGroups: [pipWindow.VideoMeetingControlGroup.MICROPHONE_SWITCH]
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)
              expect(true).assertTrue();
            }).catch((err: BusinessError) => {
              console.error(`${message} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
              expect().assertFail();
            });
            await sleep(1000);
            await pipController.stopPiP();
            await sleep(1000);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0300
     * @tc.name       : test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE
     * @tc.desc       : 验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500,
        controlGroups: [pipWindow.VideoLiveControlGroup.VIDEO_PLAY_PAUSE]
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)
              expect(true).assertTrue();
            }).catch((err: BusinessError) => {
              console.error(`${message} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
              expect().assertFail();
            });
            await sleep(1000);
            await pipController.stopPiP();
            await sleep(1000);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0400
     * @tc.name       : test_VideoLiveControlGroup_MUTE_SWITCH
     * @tc.desc       : 验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_VideoLiveControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_VideoLiveControlGroup_MUTE_SWITCH!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500,
        controlGroups: [pipWindow.VideoLiveControlGroup.MUTE_SWITCH]
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)
              expect(true).assertTrue();
            }).catch((err: BusinessError) => {
              console.error(`${message} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
              expect().assertFail();
            });
            await sleep(1000);
            await pipController.stopPiP();
            await sleep(1000);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0500
     * @tc.name       : test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE
     * @tc.desc       : 验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500,
        controlGroups: [pipWindow.VideoLiveControlGroup.MUTE_SWITCH, pipWindow.VideoLiveControlGroup.VIDEO_PLAY_PAUSE]
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`);
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`);
              expect(true).assertTrue();
            }).catch((err: BusinessError) => {
              console.error(`${message} promise failed to start pip, errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
              expect().assertFail();
            });
            await sleep(1000);
            await pipController.stopPiP();
            await sleep(1000);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0100
     * @tc.name       : test_on_controlEvent
     * @tc.desc       : 验证on_controlEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_on_controlEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_controlEvent!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let controlParam: pipWindow.ControlEventParam;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      let callback = (control: pipWindow.ControlEventParam) => {
        console.info(`${message} success in callback, control: ${control}`)
        controlParam = control
      }
      let driver: Driver =
        Driver.create();
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            await pipController.startPiP();
            pipController.on('controlEvent', callback);
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let BoundsCenter = await button1.getBoundsCenter();
            let x = BoundsCenter.x;
            let y = BoundsCenter.y;
            console.log(`${message} BoundsCenter x: ${x}, y: ${y}`);
            await driver.findComponent(ON.id('SCBPipSceneOverlay')).then(async (component) => {
              await component.click();
              await sleep(1000);
              await driver.click(x, y + 182);
            })
            await sleep(1000);
            expect(controlParam.controlType).assertEqual(pipWindow.PiPControlType.VIDEO_PLAY_PAUSE);
            expect(controlParam.status).assertEqual(pipWindow.PiPControlStatus.PAUSE);
            await pipController.stopPiP();
            await sleep(10000)
            pipController.off('controlEvent', callback);
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          pipController?.off('controlEvent', callback);
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }


    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0200
     * @tc.name       : test_off_controlEvent
     * @tc.desc       : 验证on_controlEvent
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_off_controlEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_off_controlEvent!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let controlParam: pipWindow.ControlEventParam;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      let callback = (control: pipWindow.ControlEventParam) => {
        console.error(`${message} success in callback, control: ${control}`)
        controlParam = control
      }
      let driver: Driver =
        Driver.create();
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            await pipController.startPiP();
            pipController.on('controlEvent', callback);
            pipController.off('controlEvent');
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let BoundsCenter = await button1.getBoundsCenter();
            let x = BoundsCenter.x;
            let y = BoundsCenter.y;
            console.log(`${message} BoundsCenter x: ${x}, y: ${y}`);
            await driver.findComponent(ON.id('SCBPipSceneOverlay')).then(async (component) => {
              await component.click();
              await sleep(1000);
              await driver.click(x, y + 182);
            })
            await sleep(1000);
            expect(controlParam).assertEqual(undefined);
            await pipController.stopPiP();
            await sleep(1000)
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(`${message} promise Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`);
          pipController?.off('controlEvent');
          if (err.code == 801) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.log(`${message} Failed to create pipcontroller.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_updateContentNode_ErrorCode_0100
     * @tc.name       : test_updateContentNode_ErrorCode_401
     * @tc.desc       : updateContentNode验证401
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_updateContentNode_ErrorCode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_updateContentNode_ErrorCode_401!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.updateContentNode(null);
              console.log(`${message} Succeeded updateContentNode`);
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801 || err.code == 401).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_updateContentNode_ErrorCode_0200
     * @tc.name       : test_updateContentNode_ErrorCode_801
     * @tc.desc       : 验证updateContentNode接口801
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_updateContentNode_ErrorCode_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_updateContentNode_ErrorCode_801!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      let windowClass = windowStage.getMainWindowSync();
      let uiContext = windowClass.getUIContext();
      let contentNode = typeNode.createNode(uiContext, 'XComponent')
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              console.log(`${message} Succeeded startPiP`);
              await sleep(1000);
              await pipController.updateContentNode(contentNode);
              console.log(`${message} Succeeded updateContentNode`);
              expect(true).assertTrue();
              await pipController.stopPiP();
              await sleep(1000)
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_updateContentNode_0100
     * @tc.name       : test_updateContentNode1
     * @tc.desc       : 验证先updateContentNode后startPIP
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_updateContentNode1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_updateContentNode1!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      let windowClass = windowStage.getMainWindowSync();
      let uiContext = windowClass.getUIContext();
      let contentNode = typeNode.createNode(uiContext, 'XComponent');
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.updateContentNode(contentNode);
              await sleep(1000);
              console.log(`${message} Succeeded updateContentNode`);
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              expect(true).assertTrue();
              await pipController.stopPiP();
              await sleep(1000)
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_updateContentNode_0200
     * @tc.name       : test_updateContentNode2
     * @tc.desc       : 验证先startPIP后updateContentNode
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_updateContentNode2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_updateContentNode2!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      let windowClass = windowStage.getMainWindowSync();
      let uiContext = windowClass.getUIContext();
      let contentNode = typeNode.createNode(uiContext, 'XComponent');
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.updateContentNode(contentNode);
              console.log(`${message} Succeeded updateContentNode`);
              expect(true).assertTrue();
              await pipController.stopPiP();
              await sleep(1000)
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_updateContentSize_0100
     * @tc.name       : test_updateContentSize_401
     * @tc.desc       : 验证updateContentSize接口401
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_updateContentSize_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_updateContentSize_401!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let controlParam: pipWindow.ControlEventParam;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              pipController.updateContentSize(null, null);
              console.log(`${message} Succeeded updateContentSize`);
              expect().assertFail();
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801 || err.code == 401).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0100
     * @tc.name       : test_pip_create_with_localstorage
     * @tc.desc       : 验证pipwindow.create带localstorage参数
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_pip_create_with_localstorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_pip_create_with_localstorage!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let para: Record<string, number> = {'PropA': 47};
      let storage: LocalStorage = new LocalStorage(para)
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500,
        localStorage: storage
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.stopPiP();
              await sleep(1000)
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0200
     * @tc.name       : test_pip_create_null_localstorage
     * @tc.desc       : 验证pipwindow.create带localstorage参数为null
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_pip_create_null_localstorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_pip_create_null_localstorage!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500,
        localStorage: null!
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.stopPiP();
              await sleep(1000)
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0300
     * @tc.name       : test_pip_create_undefined_localstorage
     * @tc.desc       : 验证pipwindow.create带localstorage参数为undefined
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_pip_create_undefined_localstorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_pip_create_undefined_localstorage!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_LIVE,
        contentWidth: 500,
        contentHeight: 500,
        localStorage: undefined
      };
      try {
        let promise = pipWindow.create(config);
        promise.then(async (data) => {
          pipController = data;
          if (!pipController.isPiPSupported()) {
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.stopPiP();
              await sleep(1000)
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}

