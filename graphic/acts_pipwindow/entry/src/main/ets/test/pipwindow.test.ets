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
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import pipWindow from '@ohos.PiPWindow';
import { typeNode } from '@ohos.arkui.node';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { TextNodeController } from './CustomNode.test';

export default function pipWindowTest(context1: common.BaseContext, windowStage: ohosWindow.WindowStage) {
  describe('window_pipWindow_test', () => {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;
    let tag = 'pipWindowTest'

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
     * @tc.level      : Level3
     */
    it('isPiPEnabled_test', 0, async (done:Function) => {
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
    it('create_Function_Promise', 0, async (done:Function) => {
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
    it('startPiP_Function_Promise', 0, async (done:Function) => {
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
    it('stopPiP_Function_Promise', 0, async (done:Function) => {
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
    it('setAutoStartEnabled_test', 0, async (done:Function) => {
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
    it('updateContentSize_test', 0, async (done:Function) => {
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
    it('stateChange_Function_Callback', 0, async (done:Function) => {
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
    it('stateChange_test', 0, async (done:Function) => {
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
    it('controlPanelActionEvent_Function_Callback', 0, async (done:Function) => {
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
    it('controlPanelActionEvent_test', 0, async (done:Function) => {
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
     * @tc.level      : Level3
     */
    it('testPiPTemplateType', 0, async (done:Function) => {
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
     * @tc.level      : Level3
     */
    it('testPiPEvent', 0, async (done:Function) => {
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
    it('create_Function_Promise_2', 0, async (done:Function) => {
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
    it('create_Function_Promise_3', 0, async (done:Function) => {
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
    it('create_Function_Promise_4', 0, async (done:Function) => {
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
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT', 2, async (done:Function) => {
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
    it('test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD', 2, async (done:Function) => {
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
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_HANG_UP_BUTTON', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_MUTE_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH', 2, async (done:Function) => {
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
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH', 2, async (done:Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestUpdatePiPControlStatusInVideoPlay', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestUpdatePiPControlStatelessType', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestUpdatePiPControlStatusInVideoCall', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestUpdatePiPControlStatusInVideoMeeting', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestUpdatePiPControlStatusInVideoLive', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestSetPiPControlEnabledInVideoPlay', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestSetPiPControlEnabledInVideoCall', 2, (done: Function) => {
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
     * @tc.level      : Level 2
     */
    it('TestSetPiPControlEnabledInVideoMeeting', 2, (done: Function) => {
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
    it('testPiPControlCustomUI', 2, (done: Function) => {
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
    it('testCreateArgsContentNode', 2, (done: Function) => {
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
     * @tc.number     : SUB_BASIC_WMS_PIP_GET_PIP_WINDOW_INFO_0100
     * @tc.name       : testgetPiPWindowInfo
     * @tc.desc       : testgetPiPWindowInfo
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testgetPiPWindowInfo', 2, (done: Function) => {
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
  })
}

