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
import { StartOptions } from '@kit.AbilityKit';
import window from '@ohos.window';
import { display } from "@kit.ArkUI";
import deviceInfo from '@ohos.deviceInfo';

let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartAbility',
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextStart') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message)}`);
  });
  await sleep(1000)
}

// 截断小数位并格式化为两位
function truncateAndFormat(num: number): string {
  const truncated = Math.trunc(num * 100) / 100;
  return truncated.toFixed(2);
}

async function isPipWindowSupport(context1: common.BaseContext) {
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
  pipController = await pipWindow.create(config);
  let isPipWindowSupport = pipController.isPiPSupported();
  console.log('isPipWindowSupport:' + isPipWindowSupport);
  await pipController.startPiP();
  await sleep(300)
  await pipController.stopPiP();
  await sleep(3000);
  if (isPipWindowSupport) {
    return true;
  } else {
    return false;
  }
}

// let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

export default function pipWindowTest(context1: common.BaseContext, windowStage: ohosWindow.WindowStage) {
  describe('window_pipWindow_test', () => {
    console.log('describe window_api_test start!!!')
    let deviceType: string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    const TRUE_FLAG = true;
    let tag = 'pipWindowTest'
    let isPipWindowEnabled = false;
    let windowStage: window.WindowStage = AppStorage.get('windowStage') as window.WindowStage;
    let isAutoWindow: string = settings.getValueSync(globalThis.abilityContext, 'window_pcmode_switch_status', '', settings.domainName.USER_PROPERTY);
    let isPCStatus: string = settings.getValueSync(globalThis.abilityContext, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY);
    //isPCStatus == '' 非PC设备
    //isPCStatus == '1' PC设备状态栏dock未融合
    //isPCStatus == '0' PC设备状态栏dock融合
    console.info(`beforeAll isPCStatus: ` + isPCStatus);
    let isFreeWindowMode = false;
    let sleep = async (time: number): Promise<void> => {
      let timeoutId: number | null = null;
      await new Promise((resolve: (value: string) => void) => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      });
      clearTimeout(timeoutId)
    }

    let initConfig = (PiPTemplateType: pipWindow.PiPTemplateType): pipWindow.PiPConfiguration => {
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

    beforeAll(async () => {
      isPipWindowEnabled = await isPipWindowSupport(context1);
      console.log('beforeAll isPipEnabled:' + isPipWindowEnabled);
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      try {
        let driver = Driver.create();
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        console.log('findComponent allowed: ' + JSON.stringify(allowed));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent allowed failed: ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await sleep(800)
    })

    /**
     * @tc.name   OH_PictureInPicture_On_ActiveStatusChange_0100
     * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0100
     * @tc.desc   OH_PictureInPicture_On_ActiveStatusChange_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_On_ActiveStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_On_ActiveStatusChange_0100';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
        if (!isFreeWindowMode) {
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
            let callbackIndex = 0;
            const callback = async (res: boolean) => {
              console.log(`${caseName} callback res: ${res}`)
              callbackIndex = callbackIndex + 1;
              console.log(`${caseName} callback callbackIndex: ${callbackIndex}`)
              expect(res).assertEqual(false)
            }
            let driver = Driver.create();
            pipWindow.create(config).then(async (data) => {
              pipController = data;
              console.log(`${caseName} Succeeded in creating pip controller. Data:${data}`);
              expect(data != null).assertTrue();
              pipController.on('activeStatusChange', callback);
              await pipController.startPiP();
              await sleep(1000)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              console.log(`${caseName} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
              await sleep(1000)
              let pipWindowCenter = await pipWindowComponent.getBoundsCenter();
              console.log(`${caseName} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
              let displayInfo = display.getDefaultDisplaySync();
              console.log(`${caseName} displayInfo: ${JSON.stringify(displayInfo)}`);
              let dragToX = pipWindowCenter.x + displayInfo.width;
              let dragToY = pipWindowCenter.y;
              await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX, dragToY);
              await sleep(3000);
              let expectValue = deviceType == 'tv' ? 0 : 1
              expect(callbackIndex).assertEqual(expectValue);
              await pipController?.stopPiP();
              await sleep(3000);
              pipController?.off('activeStatusChange');
              done();
            }).catch((err: BusinessError) => {
              console.log(`${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
              if (err.code == 801) {
                expect(err.message != null).assertTrue();
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            });
          } catch (error) {
            console.log(`${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        } else {
          done()
        }
      }
    })

    /**
     * @tc.name   OH_PictureInPicture_On_ActiveStatusChange_0200
     * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0200
     * @tc.desc   OH_PictureInPicture_On_ActiveStatusChange_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_On_ActiveStatusChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_On_ActiveStatusChange_0200';
      console.log(caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
        if (!isFreeWindowMode) {
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
            let callbackIndex1 = 0;
            let callbackIndex2 = 0;
            const callback = async (res: boolean) => {
              console.log(`${caseName} callback res: ${res}`)
              callbackIndex1 = callbackIndex1 + 1;
              console.log(`${caseName} callback callbackIndex1: ${callbackIndex1}`)
              expect(res).assertEqual(false)
            }
            const callback2 = async (res: boolean) => {
              console.log(`${caseName} callback2 res: ${res}`)
              callbackIndex2 = callbackIndex2 + 1;
              console.log(`${caseName} callback2 callbackIndex2: ${callbackIndex2}`)
              expect(res).assertEqual(false)
            }
            let driver = Driver.create();
            pipWindow.create(config).then(async (data) => {
              pipController = data;
              console.log(`${caseName} Succeeded in creating pip controller. Data:${data}`);
              expect(data != null).assertTrue();
              pipController.on('activeStatusChange', callback);
              pipController.on('activeStatusChange', callback2);
              await pipController.startPiP();
              await sleep(1000)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              await sleep(1000)
              let pipWindowCenter = await pipWindowComponent.getBoundsCenter();
              console.log(`${caseName} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
              let displayInfo = display.getDefaultDisplaySync();
              console.log(`${caseName} displayInfo: ${JSON.stringify(displayInfo)}`);
              let dragToX = pipWindowCenter.x + displayInfo.width;
              let dragToY = pipWindowCenter.y;
              await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX, dragToY);
              await sleep(3000);
              let expectValue = deviceType == 'tv' ? 0 : 1
              expect(callbackIndex1).assertEqual(expectValue);
              expect(callbackIndex2).assertEqual(expectValue);
              await pipController?.stopPiP();
              await sleep(3000);
              pipController?.off('activeStatusChange');
              done();
            }).catch((err: BusinessError) => {
              console.log(`${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
              if (err.code == 801) {
                expect(err.message != null).assertTrue();
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            });
          } catch (error) {
            console.log(`${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        } else {
          done()
        }
      }
    })

    /**
     * @tc.name   OH_PictureInPicture_Off_ActiveStatusChange_0100
     * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0300
     * @tc.desc   OH_PictureInPicture_Off_ActiveStatusChange_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_Off_ActiveStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_Off_ActiveStatusChange_0100';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
        if (!isFreeWindowMode) {
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
            contentHeight: contentHeight
          };
          try {
            let callbackIndex = 0;
            const callback = async (res: boolean) => {
              console.log(`${caseName} callback res: ${res}`)
              callbackIndex = callbackIndex + 1;
              console.log(`${caseName} callback callbackIndex1: ${callbackIndex}`)
              expect(res).assertEqual(false)
            }
            let driver = Driver.create();
            pipWindow.create(config).then(async (data) => {
              pipController = data;
              console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
              expect(data != null).assertTrue();
              pipController.on('activeStatusChange', callback);
              pipController?.off('activeStatusChange', callback);
              await pipController.startPiP();
              await sleep(3000)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              await sleep(1000)
              let pipWindowCenter = await pipWindowComponent.getBoundsCenter();
              console.log(`${tag} ${caseName} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
              let displayInfo = display.getDefaultDisplaySync();
              console.log(`${tag} ${caseName} displayInfo: ${JSON.stringify(displayInfo)}`);
              let dragToX = pipWindowCenter.x + displayInfo.width;
              let dragToY = pipWindowCenter.y;
              await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX, dragToY);
              await sleep(3000);
              expect(callbackIndex).assertEqual(0);
              await pipController?.stopPiP();
              await sleep(3000);
              done();
            }).catch((err: BusinessError) => {
              console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
              if (err.code == 801) {
                expect(err.message != null).assertTrue();
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            });
          } catch (error) {
            console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        } else {
          done()
        }
      }
    })

    /**
     * @tc.name   OH_PictureInPicture_Off_ActiveStatusChange_0200
     * @tc.number SUB_BASIC_WMS_PIP_ACTIVESTATUSCHANGE_0400
     * @tc.desc   OH_PictureInPicture_Off_ActiveStatusChange_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_Off_ActiveStatusChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_Off_ActiveStatusChange_0200';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
        if (!isFreeWindowMode) {
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
            contentHeight: contentHeight
          };
          try {
            let callbackIndex = 0;
            const callback = async (res: boolean) => {
              console.log(`${caseName} callback res: ${res}`)
              callbackIndex = callbackIndex + 1;
              console.log(`${caseName} callback callbackIndex2: ${callbackIndex}`)
              expect(res).assertEqual(false)
            }
            let driver = Driver.create();
            pipWindow.create(config).then(async (data) => {
              pipController = data;
              console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
              expect(data != null).assertTrue();
              pipController.on('activeStatusChange', callback);
              pipController?.off('activeStatusChange');
              await pipController.startPiP();
              await sleep(3000)
              let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
              await sleep(1000)
              let pipWindowCenter = await pipWindowComponent.getBoundsCenter();
              console.log(`${tag} ${caseName} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
              let displayInfo = display.getDefaultDisplaySync();
              console.log(`${tag} ${caseName} displayInfo: ${JSON.stringify(displayInfo)}`);
              let dragToX = pipWindowCenter.x + displayInfo.width;
              let dragToY = pipWindowCenter.y;
              await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX, dragToY);
              await sleep(3000);
              expect(callbackIndex).assertEqual(0);
              await pipController?.stopPiP();
              await sleep(3000);
              done();
            }).catch((err: BusinessError) => {
              console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
              if (err.code == 801) {
                expect(err.message != null).assertTrue();
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            });
          } catch (error) {
            console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
            expect().assertFail();
            done();
          }
        } else {
          done()
        }
      }
    })

    /**
     * @tc.name   isPiPEnabled_test
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.desc   To test the function of isPiPEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isPiPEnabled_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log('www data isPiPEnabled_test begin')
      try {
        let enable = pipWindow.isPiPEnabled();
        console.info('isPipEnabled:' + enable);
        console.log('www data Succeeded in isPipEnabled ' + enable)
        expect(enable != null).assertTrue();
        expect(enable == true || enable == false).assertTrue();
        done();
      } catch (error) {
        console.log('www data Succeeded in isPipEnabled ' + error)
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   create_Function_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.desc   To test the function of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('create_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log('www data create_Function_Promise begin')
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
        let promise = pipWindow.create(config);
        promise.then((data) => {
          pipController = data;
          console.log(`www data Succeeded in creating pip controller. Data:${data}`)
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   startPiP_Function_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.desc   To test the function of startPiP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('startPiP_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        console.log('www data startPiP_Function_Promise begin')
        let promise = pipController.startPiP();
        promise.then(() => {
          console.log('www data Succeeded in starting pip')
          done();
        }).catch((err: BusinessError) => {
          console.log('www data Failed1 to start pip. Cause:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.log('www data Failed2 to start pip. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(error.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   stopPiP_Function_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.desc   To test the function of stopPiP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('stopPiP_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        console.log('www data stopPiP_Function_Promise begin ')
        await pipController.startPiP()
        let promise = pipController.stopPiP()
        promise.then(() => {
          console.log('www data Succeeded in stopping pip')

          done();
        }).catch((err: BusinessError) => {
          if (err.code == 1300015) {
            console.log('www data window is stopping:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message))
            expect(err.message != null).assertTrue();
            done()
          } else {
            console.log('www data Failed1 to stop pip in stopPiP . Cause:' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message))
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed2 to stop pip. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        if (error.code == 801) {
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   setAutoStartEnabled_test
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.desc   To test the function of setAutoStartEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('setAutoStartEnabled_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        pipController = await pipWindow.create(config);
        console.log('www data setAutoStartEnabled_test begin')
        let enable = true;
        pipController.setAutoStartEnabled(enable);
        console.log('www data Succeeded in setAutoStartEnabled_test')

        done();
      } catch (error) {
        console.log('www data Failed to setAutoStartEnabled_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        if (error.code == 801) {
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   updateContentSize_test
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.desc   To test the function of updateContentSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('updateContentSize_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        pipController = await pipWindow.create(config);
        console.log('www data updateContentSize_test begin');
        let width = 540;
        let height = 960;
        pipController.updateContentSize(width, height);
        console.log('www data Succeeded in updateContentSize_test');

        done();
      } catch (error) {
        console.log('www data Failed to updateContentSize_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   stateChange_Function_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.desc   To test the function of stateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('stateChange_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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

        done();
      } catch (err) {
        console.log('www data Failed to stateChange_Function_ Callback' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
        if (err.code == 801) {
          expect(err.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   stateChange_test
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.desc   To test the function of stateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('stateChange_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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

          done()
        } catch (error) {
          console.log('www data Failed1 to stateChange_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.log('www data Failed2 to stateChange_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        if (error.code == 801) {
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   controlPanelActionEvent_Function_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.desc   To test the function of controlPanelActionEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('controlPanelActionEvent_Function_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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

        done();
      } catch (error) {
        console.log('www data Failed to registerActionEventCallback , event:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   controlPanelActionEvent_test
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.desc   To test the function of controlPanelActionEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('controlPanelActionEvent_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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

          done();
        } catch (error) {
          console.log('www data Failed1 to controlPanelActionEvent_test' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.log('www data Failed2 to registerActionEventCallback , event:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        if (error.code == 801) {
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testPiPTemplateType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.desc   To test the function of testPiPTemplateType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPTemplateType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testPiPEvent
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.desc   To test the function of testPiPEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPEvent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   create_Function_Promise_2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.desc   To test the function of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('create_Function_Promise_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
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
        }).catch((err: BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   create_Function_Promise_3
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.desc   To test the function of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('create_Function_Promise_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
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
        }).catch((err: BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed3 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   create_Function_Promise_4
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.desc   To test the function of create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('create_Function_Promise_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log('www data create_Function_Promise begin')
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
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
        }).catch((err: BusinessError) => {
          console.log('www data Failed1 to create pip controller. Cause' + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message))
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('www data Failed2 to create pip controller. Cause' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message))
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1600
     * @tc.desc   test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT begin');
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
        controlGroups: [pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1700
     * @tc.desc   test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD begin');
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
        controlGroups: [pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_FAST_FORWARD_BACKWARD Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1800
     * @tc.desc   test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD begin');
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
        controlGroups: [pipWindow.VideoPlayControlGroup.VIDEO_PREVIOUS_NEXT, pipWindow.VideoPlayControlGroup.FAST_FORWARD_BACKWARD]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(`${tag} test_VideoPlayControlGroup_VIDEO_PREVIOUS_NEXT_FAST_FORWARD_BACKWARD Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message) + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_1900
     * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoCallControlGroup_HANG_UP_BUTTON
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2000
     * @tc.desc   test_VideoCallControlGroup_HANG_UP_BUTTON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_HANG_UP_BUTTON begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoCallControlGroup_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2100
     * @tc.desc   test_VideoCallControlGroup_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2200
     * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH, pipWindow.VideoCallControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2300
     * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH, pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2400
     * @tc.desc   test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.HANG_UP_BUTTON, pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2500
     * @tc.desc   test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_CALL,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoCallControlGroup.MICROPHONE_SWITCH, pipWindow.VideoCallControlGroup.HANG_UP_BUTTON, pipWindow.VideoCallControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoCallControlGroup_MICROPHONE_SWITCH_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2600
     * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoMeetingControlGroup_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2700
     * @tc.desc   test_VideoMeetingControlGroup_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_VideoMeetingControlGroup_MUTE_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2800
     * @tc.desc   test_VideoMeetingControlGroup_MUTE_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_MUTE_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_MUTE_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_2900
     * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.MUTE_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3000
     * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3100
     * @tc.desc   test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.MUTE_SWITCH, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_MUTE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3200
     * @tc.desc   test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + 'test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH begin');
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let contentWidth = 400;
      let contentHeight = 600;
      let config: pipWindow.PiPConfiguration = {
        context: context1,
        componentController: mXComponentController,
        navigationId: navId,
        templateType: pipWindow.PiPTemplateType.VIDEO_MEETING,
        contentWidth: contentWidth,
        contentHeight: contentHeight,
        controlGroups: [pipWindow.VideoMeetingControlGroup.HANG_UP_BUTTON, pipWindow.VideoMeetingControlGroup.MUTE_SWITCH, pipWindow.VideoMeetingControlGroup.CAMERA_SWITCH]
      };
      try {
        pipWindow.create(config).then((data) => {
          pipController = data;
          console.log(`${tag} Succeeded in creating pip controller. Data:${data}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();

            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log(`${tag} test_VideoMeetingControlGroup_HANG_UP_BUTTON_MUTE_SWITCH_CAMERA_SWITCH Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   TestUpdatePiPControlStatusInVideoPlay
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3300
     * @tc.desc   TestUpdatePiPControlStatusInVideoPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);

                done();
              } else {
                console.error(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);

              done();
            } else {
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });

        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {

            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);

          done();
        } else {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   TestUpdatePiPControlStatelessType
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3400
     * @tc.desc   TestUpdatePiPControlStatelessType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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


              done();
            } catch (error) {
              console.error(`${message} Params error. Cause:${error.code}, message:${error.message}`);
              if (error.code == 801) {
                expect(error.message != null).assertTrue();
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);

                done();
              } else {
                console.error(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              console.info(`${message} The current device type does not support to start pip`);

              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            console.info(`${message} The current device type does not support to create pipController`);

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(error.message != null).assertTrue();
          console.info(`${message} The current device type does not support to create pipController`);

          done();
        } else {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   TestUpdatePiPControlStatusInVideoCall
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3500
     * @tc.desc   TestUpdatePiPControlStatusInVideoCall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);

                done();
              } else {
                console.info(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);

              done();
            } else {
              console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            console.info(`${message} The current device type does not support to create pipController`);

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          expect(error.message != null).assertTrue();
          console.info(`${message} The current device type does not support to create pipController`);

          done();
        } else {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   TestUpdatePiPControlStatusInVideoMeeting
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3600
     * @tc.desc   TestUpdatePiPControlStatusInVideoMeeting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);

                done();
              } else {
                console.error(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            console.error(`${message}} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);
              expect(err.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          });

        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   TestUpdatePiPControlStatusInVideoLive
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3700
     * @tc.desc   TestUpdatePiPControlStatusInVideoLive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              console.info(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to updatePiPControlStatus`);
                expect(error.message != null).assertTrue();

                done();
              } else {
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);
              expect(err.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   TestSetPiPControlEnabledInVideoPlay
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3800
     * @tc.desc   TestSetPiPControlEnabledInVideoPlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

              done();
            } catch (error) {
              console.info(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to setPiPControlEnabled`);
                expect(error.message != null).assertTrue();

                done();
              } else {
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);
              expect(err.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   TestSetPiPControlEnabledInVideoCall
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_3900
     * @tc.desc   TestSetPiPControlEnabledInVideoCall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

              done();
            } catch (error) {
              console.info(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to setPiPControlEnabled`);
                expect(error.message != null).assertTrue();

                done();
              } else {
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);
              expect(err.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   TestSetPiPControlEnabledInVideoMeeting
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4000
     * @tc.desc   TestSetPiPControlEnabledInVideoMeeting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

              done();
            } catch (error) {
              console.info(`${message} Params error. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
              if (error.code == 801) {
                console.info(`${message} The current device type does not support to setPiPControlEnabled`);
                expect(error.message != null).assertTrue();

                done();
              } else {
                expect().assertFail();
                done();
              }
            }
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to start pip. Cause:${err.code}, message:${err.message}`);
            if (err.code == 801) {
              console.info(`${message} The current device type does not support to start pip`);
              expect(err.message != null).assertTrue();

              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testPiPControlCustomUI
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4100
     * @tc.desc   testPiPControlCustomUI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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

          done();
        }).catch((err: BusinessError) => {
          console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to create pipController`);
            expect(err.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.info(`${message} Failed to create pipController. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to create pipController`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   testCreateArgsContentNode
     * @tc.number SUB_BASIC_WMS_PIP_TABIET_CONTROLS_4200
     * @tc.desc   testCreateArgsContentNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateArgsContentNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const caseName = 'TestCreateArgsContentNode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let uiContext = windowClass.getUIContext();
        let xComponentController: XComponentController = new XComponentController();
        let xComponent = typeNode.createNode(uiContext, 'XComponent');
        xComponent.initialize({
          id: 'xComponent',
          type: XComponentType.SURFACE,
          controller: xComponentController
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
        pipWindow.create(config, xComponent).then((data: pipWindow.PiPController) => {
          console.info(`${caseName} Succeeded in creating pip controller. Data:${data}`);
          expect(data !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
          if (err.code === 801) {
            console.error(`${caseName} The current device Capability not supported.`);
            expect(err.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        if (exception.code == 1300002) {
          console.info(`${caseName}: This window state is abnormal.`);
          expect(exception.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })
    /**
     * @tc.name   PiPSizeChange_Function_Callback_0
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
     * @tc.desc   To test the function of PiPSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PiPSizeChange_Function_Callback_0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isFreeWindowMode == true) {
        console.log('PiPSizeChange_Function_Callback_0 device type 2in1');
        done();
        return;
      } else {
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let res1 = false;
        let res2 = false;
        let config: pipWindow.PiPConfiguration = {
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
          console.log('data Failed0 to PiPSizeChange_test' + JSON.stringify(err2.code) + ':msg:' + JSON.stringify(err2.message))
          if (err2.code == 801 || err2.code == 401) {

            expect(err2.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    })
    /**
     * @tc.name   PiPSizeChange_Function_Callback_1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
     * @tc.desc   To test the function of PiPSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PiPSizeChange_Function_Callback_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isFreeWindowMode == true) {
        console.log('PiPSizeChange_Function_Callback_1 device type 2in1');
        done();
        return;
      } else {
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let res1 = false;
        let res2 = false;
        let config: pipWindow.PiPConfiguration = {
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

          }).catch((err0: BusinessError) => {
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
          console.log('data Failed2 to PiPSizeChange_test' + JSON.stringify(err2.code) + ':msg:' + JSON.stringify(err2.message))
          if (err2.code == 801 || err2.code == 401) {
            expect(err2.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    })
    /**
     * @tc.name   PiPSizeChange_Function_Callback_2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
     * @tc.desc   To test the function of PiPSizeChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PiPSizeChange_Function_Callback_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isFreeWindowMode == true) {
        console.log('PiPSizeChange_Function_Callback_2 device type 2in1');
        done();
        return;
      } else {
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let navId = "";
        let contentWidth = 400;
        let contentHeight = 600;
        let res1 = false;
        let res2 = false;
        let config: pipWindow.PiPConfiguration = {
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

            done()
          } catch (err0) {
            console.log('PiPSizeChange Failed to off register: ' + JSON.stringify(err0));
            expect().assertFail();
            done();
          }
          let promise = pipController.startPiP();
          promise.then(() => {
            console.log('PiPSizeChange data Succeeded in starting pip');

          }).catch((err1: BusinessError) => {
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
          console.log('data Failed3 to PiPSizeChange_test' + JSON.stringify(err2.code) + ':msg:' + JSON.stringify(err2.message));
          if (err2.code == 801 || err2.code == 401) {
            expect(err2.message != null).assertTrue();

            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    })

    /**
     * @tc.name   testgetPiPWindowInfo
     * @tc.number SUB_BASIC_WMS_PIP_GET_PIP_WINDOW_INFO_0100
     * @tc.desc   testgetPiPWindowInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
          id: 'xcomponent',
          type: XComponentType.SURFACE,
          controller: xComponentController
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

        let promise1: Promise<pipWindow.PiPController> = pipWindow.create(config, xComponent);
        promise1.then((data: pipWindow.PiPController) => {
          pipController = data;
          console.info(`${caseName} Succeeded in creating pip controller. Data:${data}`);
          let promise2: Promise<void> = pipController.startPiP();
          promise2.then(() => {
            console.info(`${caseName} Succeeded in starting pip.`);
            let promise3: Promise<pipWindow.PiPWindowInfo> = pipController.getPiPWindowInfo();
            promise3.then((data) => {
              pipWindowInfo = data;
              console.info(caseName + ' Success in get pip window info. Info windowId: ' + JSON.stringify(pipWindowInfo.windowId) + ' windowSize: ' + JSON.stringify(pipWindowInfo.size));

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
          if (err.code == 801) {
            expect(err.message != null).assertTrue();
            done();
          } else {
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
     * @tc.name   testUpdateContentSizeErrCode401_0100
     * @tc.number testUpdateContentSizeErrCode401_0100
     * @tc.desc   testUpdateContentSizeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        console.log(message + 'Failed2 to call updateContentSize. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(message + '此设备不支持updateContentSize能力.');
          expect(error.message != null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testUpdatePiPControlStatusErrCode401_0100
     * @tc.number testUpdatePiPControlStatusErrCode401_0100
     * @tc.desc   testUpdatePiPControlStatusErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        console.log(message + 'Failed2 to call updatePiPControlStatus. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(message + '此设备不支持updatePiPControlStatus能力.');
          expect(error.message != null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetPiPControlEnabledErrCode401_0100
     * @tc.number testSetPiPControlEnabledErrCode401_0100
     * @tc.desc   testSetPiPControlEnabledErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        console.log(message + 'Failed2 to call setPiPControlEnabled. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(message + '此设备不支持setPiPControlEnabled能力.');
          expect(error.message != null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testOnPipWindowSizeChangeErrCode401_0100
     * @tc.number testOnPipWindowSizeChangeErrCode401_0100
     * @tc.desc   testOnPipWindowSizeChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          const callback = (res: pipWindow.PiPWindowSize) => { }
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
        console.log(message + 'Failed2 to call on_pipWindowSizeChange. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(message + '此设备不支持on_pipWindowSizeChange能力.');
          expect(error.message != null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testOffPipWindowSizeChangeErrCode401_0100
     * @tc.number testOffPipWindowSizeChangeErrCode401_0100
     * @tc.desc   testOffPipWindowSizeChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          const callback = (res: pipWindow.PiPWindowSize) => { }
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
        console.log(message + 'Failed2 to call off_pipWindowSizeChange. Cause:' + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
        if (error.code == 801) {
          console.info(message + '此设备不支持off_pipWindowSizeChange能力.');
          expect(error.message != null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testGetPiPWindowInfoErrCode1300014_0100
     * @tc.number testGetPiPWindowInfoErrCode1300014_0100
     * @tc.desc   testGetPiPWindowInfoErrCode1300014_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            expect(err.message != null).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to getPiPWindowInfo. Cause:${err.code}, message:${err.message}`);
            expect(err.code).assertEqual(1300014);
            expect(err.message != null).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code == 801) {
          console.info(`${message} The current device type does not support to getPiPWindowInfo`);
          expect(error.message != null).assertTrue();

          done();
        } else {
          console.info(`${message} Failed2 to getPiPWindowInfo. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
        done();
      }
    })

    /**
     * @tc.name   test_pipWindowSizeChange
     * @tc.number SUB_BASIC_WMS_ON_PIP_WINDOW_SIZE_CHANGE_0100
     * @tc.desc   验证updateContentSize后获取pipWindow宽高正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_videoCallControlGroup_MUTE_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0100
     * @tc.desc   验证VIDEO_CALL仅有一个VideoCallControlGroup.MUTE_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)

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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_VideoMeetingControlGroup_MICROPHONE_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0200
     * @tc.desc   验证VIDEO_CALL仅有一个VideoCallControlGroup.MUTE_SWITCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)

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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_VideoLiveControlGroup_VIDEO_PLAY_PAUSE
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0300
     * @tc.desc   验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)

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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_VideoLiveControlGroup_MUTE_SWITCH
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0400
     * @tc.desc   验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`)
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`)

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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_VideoLiveControlGroup_MUTE_SWITCH_VIDEO_PLAY_PAUSE
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_TEMPLATE_0500
     * @tc.desc   验证VIDEO_CALL仅有一个VideoLiveControlGroup.VIDEO_PLAY_PAUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller. Data:${data}`);
            let promise = pipController.startPiP();
            promise.then(() => {
              console.log(`${message} Succeeded in starting pip`);

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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_on_controlEvent
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0100
     * @tc.desc   验证on_controlEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            await pipController.startPiP();
            await sleep(1000);
            pipController.on('controlEvent', callback);
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let Bounds = await button1.getBounds()
            let bottom = Bounds.bottom
            let BoundsCenter = await button1.getBoundsCenter();
            let x = BoundsCenter.x;
            console.log(`${message} BoundsCenter x: ${x}, bottom: ${bottom}`);
            await driver.findComponent(ON.id('SCBPipSceneOverlay')).then(async (component) => {
              await component.click();
              await sleep(1000);
              let button2 = await driver.findComponent(ON.id('control_play'));
              console.log(`${message} button2: ${JSON.stringify(button2)}`);
              await button2.click();
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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_off_controlEvent
     * @tc.number SUB_BASIC_WMS_PIP_WINDOW_ON_CONTROLEVENT_0200
     * @tc.desc   验证on_controlEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            await pipController.startPiP();
            await sleep(1000);
            pipController.on('controlEvent', callback);
            pipController.off('controlEvent');
            let button1 = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            let Bounds = await button1.getBounds()
            let bottom = Bounds.bottom
            let BoundsCenter = await button1.getBoundsCenter();
            let x = BoundsCenter.x;
            console.log(`${message} BoundsCenter x: ${x}, bottom: ${bottom}`);
            await driver.findComponent(ON.id('SCBPipSceneOverlay')).then(async (component) => {
              await component.click();
              await sleep(1000);
              let button2 = await driver.findComponent(ON.id('control_play'));
              console.log(`${message} button2: ${JSON.stringify(button2)}`);
              await button2.click();
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
            expect(err.message != null).assertTrue();

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
     * @tc.name   test_updateContentNode_ErrorCode_401
     * @tc.number SUB_BASIC_WMS_updateContentNode_ErrorCode_0100
     * @tc.desc   updateContentNode验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_updateContentNode_ErrorCode_801
     * @tc.number SUB_BASIC_WMS_updateContentNode_ErrorCode_0200
     * @tc.desc   验证updateContentNode接口801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              console.log(`${message} Succeeded startPiP`);
              await sleep(1000);
              await pipController.updateContentNode(contentNode);
              console.log(`${message} Succeeded updateContentNode`);

              await pipController.stopPiP();
              await sleep(1000)
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_updateContentNode1
     * @tc.number SUB_BASIC_WMS_updateContentNode_0100
     * @tc.desc   验证先updateContentNode后startPIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

              await pipController.stopPiP();
              await sleep(1000)
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_updateContentNode2
     * @tc.number SUB_BASIC_WMS_updateContentNode_0200
     * @tc.desc   验证先startPIP后updateContentNode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.updateContentNode(contentNode);
              console.log(`${message} Succeeded updateContentNode`);

              await pipController.stopPiP();
              await sleep(1000)
              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentNode, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentNode, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_updateContentSize_401
     * @tc.number SUB_BASIC_WMS_updateContentSize_0100
     * @tc.desc   验证updateContentSize接口401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              expect(err.message != null).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_pip_create_with_localstorage
     * @tc.number SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0100
     * @tc.desc   验证pipwindow.create带localstorage参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_pip_create_with_localstorage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_pip_create_with_localstorage!'
      let pipController: pipWindow.PiPController | undefined = undefined;
      let mXComponentController = new XComponentController();
      let navId = "";
      let para: Record<string, number> = { 'PropA': 47 };
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.stopPiP();
              await sleep(1000)

              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              expect(err.message != null).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_pip_create_null_localstorage
     * @tc.number SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0200
     * @tc.desc   验证pipwindow.create带localstorage参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.stopPiP();
              await sleep(1000)

              done();
            } catch (err) {
              console.error(`${message} Failed to updateContentSize, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801).assertTrue();
              expect(err.message != null).assertTrue();
              done();
            }
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_pip_create_undefined_localstorage
     * @tc.number SUB_BASIC_WMS_PIP_CREATE_LOCALSTORAGE_0300
     * @tc.desc   验证pipwindow.create带localstorage参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            try {
              await pipController.startPiP();
              await sleep(1000);
              console.log(`${message} Succeeded startPiP`);
              await pipController.stopPiP();
              await sleep(1000)

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
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPipWindowDefaultWindowSize_0100
     * @tc.number testPipWindowDefaultWindowSize_0100
     * @tc.desc   验证画中画窗口按大窗启动第二次传入undefined按关闭前大小启动
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipWindowDefaultWindowSize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testPipWindowDefaultWindowSize_0100!'
      try {
        if (!isPipWindowEnabled) {
          done();
        } else {
          await startAbility(message, globalThis.abilityContext);
          let driver = Driver.create();
          let createPip1 = await driver.findComponent(ON.id('CreatePipWindow1'));
          await sleep(1000)
          await createPip1.click();
          // 确认是否是801
          let isSupported = await driver.findComponent(ON.id('isSupported'));
          await sleep(1000)
          let isSupportedText = await isSupported.getText();
          console.error(`${message} isSupportedText: ${isSupportedText}`);
          if (isSupportedText === '801') {
            await terminateAbility(message);
            await sleep(1000)
            done();
          } else {
            let getPipInfo1 = await driver.findComponent(ON.id('GetPiPWindowInfo1'));
            await sleep(1000)
            await getPipInfo1.click();
            let getPipInfoText1 = await driver.findComponent(ON.id('PipWindowInfoText1'));
            await sleep(1000)
            let text1 = await getPipInfoText1.getText();
            console.error(`${message} text1: ${text1}`);
            expect(Number(text1.trim())).assertEqual(1)
            let stopPip1 = await driver.findComponent(ON.id('StopPiPWindow1'));
            await sleep(1000)
            await stopPip1.click();
            await terminateAbility(message);
            await sleep(1000)

            await startAbility(message, globalThis.abilityContext);
            let createPip2 = await driver.findComponent(ON.id('CreatePipWindow2'));
            await sleep(1000)
            await createPip2.click();
            let getPipInfo2 = await driver.findComponent(ON.id('GetPiPWindowInfo2'));
            await sleep(1000)
            await getPipInfo2.click();
            let getPipInfoText2 = await driver.findComponent(ON.id('PipWindowInfoText2'));
            await sleep(1000)
            let text2 = await getPipInfoText2.getText();
            console.error(`${message} text2: ${text2}`);
            expect(Number(text2.trim())).assertEqual(1)
            let stopPip2 = await driver.findComponent(ON.id('StopPiPWindow2'));
            await sleep(1000)
            await stopPip2.click();
            await terminateAbility(message);
            await sleep(1000)
            done()
          }
        }

      } catch (err) {
        console.error(`${message} Failed, Cause code ${err.code}, message ${err.message}`);
        if (err.code === 801) {
          done();
        } else {
          await terminateAbility(message);
          await sleep(1000)
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testPipWindowDefaultWindowSize_0200
     * @tc.number testPipWindowDefaultWindowSize_0200
     * @tc.desc   验证画中画窗口按大窗启动第二次传入0按关闭前大小启动
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipWindowDefaultWindowSize_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testPipWindowDefaultWindowSize_0200!'
      try {
        if (!isPipWindowEnabled) {
          done();
        } else {
          await startAbility(message, globalThis.abilityContext);
          let driver = Driver.create();
          let createPip1 = await driver.findComponent(ON.id('CreatePipWindow1'));
          await sleep(1000)
          await createPip1.click();
          // 确认是否是801
          let isSupported = await driver.findComponent(ON.id('isSupported'));
          await sleep(1000)
          let isSupportedText = await isSupported.getText();
          console.error(`${message} isSupportedText: ${isSupportedText}`);
          if (isSupportedText === '801') {
            await terminateAbility(message);
            await sleep(1000)
            done();
          } else {
            let getPipInfo1 = await driver.findComponent(ON.id('GetPiPWindowInfo1'));
            await sleep(1000)
            await getPipInfo1.click();
            let getPipInfoText1 = await driver.findComponent(ON.id('PipWindowInfoText1'));
            await sleep(1000)
            let text1 = await getPipInfoText1.getText();
            console.error(`${message} text1: ${text1}`);
            expect(Number(text1.trim())).assertEqual(1)
            let stopPip1 = await driver.findComponent(ON.id('StopPiPWindow1'));
            await sleep(1000)
            await stopPip1.click();
            await terminateAbility(message);
            await sleep(1000)

            await startAbility(message, globalThis.abilityContext);
            let createPip3 = await driver.findComponent(ON.id('CreatePipWindow3'));
            await sleep(1000)
            await createPip3.click();
            let getPipInfo3 = await driver.findComponent(ON.id('GetPiPWindowInfo3'));
            await sleep(1000)
            await getPipInfo3.click();
            let getPipInfoText3 = await driver.findComponent(ON.id('PipWindowInfoText3'));
            await sleep(1000)
            let text3 = await getPipInfoText3.getText();
            console.error(`${message} text3: ${text3}`);
            expect(Number(text3.trim())).assertEqual(1)
            let stopPip3 = await driver.findComponent(ON.id('StopPiPWindow3'));
            await sleep(1000)
            await stopPip3.click();
            await terminateAbility(message);
            await sleep(1000)
            done()
          }
        }

      } catch (err) {
        console.error(`${message} Failed, Cause code ${err.code}, message ${err.message}`);
        if (err.code === 801) {
          done();
        } else {
          await terminateAbility(message);
          await sleep(1000)
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testPipWindowDefaultWindowSize_0300
     * @tc.number testPipWindowDefaultWindowSize_0300
     * @tc.desc   验证画中画窗口小窗启动后第二次传入undefined按关闭前大小启动
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipWindowDefaultWindowSize_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testPipWindowDefaultWindowSize_0300!'
      try {

        if (!isPipWindowEnabled) {
          done();
        } else {
          await startAbility(message, globalThis.abilityContext);
          let driver = Driver.create();
          let createPip4 = await driver.findComponent(ON.id('CreatePipWindow4'));
          await sleep(1000)
          await createPip4.click();
          // 确认是否是801
          let isSupported = await driver.findComponent(ON.id('isSupported'));
          await sleep(1000)
          let isSupportedText = await isSupported.getText();
          console.error(`${message} isSupportedText: ${isSupportedText}`);
          if (isSupportedText === '801') {
            await terminateAbility(message);
            await sleep(1000)
            done();
          } else {
            let getPipInfo4 = await driver.findComponent(ON.id('GetPiPWindowInfo4'));
            await sleep(1000)
            await getPipInfo4.click();
            let getPipInfoText4 = await driver.findComponent(ON.id('PipWindowInfoText4'));
            await sleep(1000)
            let text4 = await getPipInfoText4.getText();
            console.error(`${message} text4: ${text4}`);
            expect(Number(text4.trim())).assertLarger(0);
            expect(Number(text4.trim())).assertLess(1);
            let stopPip4 = await driver.findComponent(ON.id('StopPiPWindow4'));
            await sleep(1000)
            await stopPip4.click();
            await terminateAbility(message);
            await sleep(1000)

            await startAbility(message, globalThis.abilityContext);
            let createPip2 = await driver.findComponent(ON.id('CreatePipWindow2'));
            await sleep(1000)
            await createPip2.click();
            let getPipInfo2 = await driver.findComponent(ON.id('GetPiPWindowInfo2'));
            await sleep(1000)
            await getPipInfo2.click();
            let getPipInfoText2 = await driver.findComponent(ON.id('PipWindowInfoText2'));
            await sleep(1000)
            let text2 = await getPipInfoText2.getText();
            console.error(`${message} text2: ${text2}`);
            let textNum2 = Number(truncateAndFormat(Number(text2.trim())));
            let textNum4 = Number(truncateAndFormat(Number(text4.trim())));
            expect(textNum2).assertEqual(textNum4);
            let stopPip2 = await driver.findComponent(ON.id('StopPiPWindow2'));
            await sleep(1000)
            await stopPip2.click();
            await terminateAbility(message);
            await sleep(1000)
            done()
          }
        }


      } catch (err) {
        console.error(`${message} Failed, Cause code ${err.code}, message ${err.message}`);
        if (err.code === 801) {
          done();
        } else {
          await terminateAbility(message);
          await sleep(1000)
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testPipWindowDefaultWindowSize_0400
     * @tc.number testPipWindowDefaultWindowSize_0400
     * @tc.desc   验证画中画窗口小窗启动后第二次传入0按上次关闭大小启动
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipWindowDefaultWindowSize_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testPipWindowDefaultWindowSize_0400!'
      try {
        if (!isPipWindowEnabled) {
          done();
        } else {
          await startAbility(message, globalThis.abilityContext);
          let driver = Driver.create();
          let createPip4 = await driver.findComponent(ON.id('CreatePipWindow4'));
          await sleep(1000)
          await createPip4.click();
          // 确认是否是801
          let isSupported = await driver.findComponent(ON.id('isSupported'));
          await sleep(1000)
          let isSupportedText = await isSupported.getText();
          console.error(`${message} isSupportedText: ${isSupportedText}`);
          if (isSupportedText === '801') {
            await terminateAbility(message);
            await sleep(1000)
            done();
          } else {
            let getPipInfo4 = await driver.findComponent(ON.id('GetPiPWindowInfo4'));
            await sleep(1000)
            await getPipInfo4.click();
            let getPipInfoText4 = await driver.findComponent(ON.id('PipWindowInfoText4'));
            await sleep(1000)
            let text4 = await getPipInfoText4.getText();
            console.error(`${message} text4: ${text4}`);
            expect(Number(text4.trim())).assertLarger(0);
            expect(Number(text4.trim())).assertLess(1);
            let stopPip4 = await driver.findComponent(ON.id('StopPiPWindow4'));
            await sleep(1000)
            await stopPip4.click();
            await terminateAbility(message);
            await sleep(1000)

            await startAbility(message, globalThis.abilityContext);
            let createPip3 = await driver.findComponent(ON.id('CreatePipWindow3'));
            await sleep(1000)
            await createPip3.click();
            let getPipInfo3 = await driver.findComponent(ON.id('GetPiPWindowInfo3'));
            await sleep(1000)
            await getPipInfo3.click();
            let getPipInfoText3 = await driver.findComponent(ON.id('PipWindowInfoText3'));
            await sleep(1000)
            let text3 = await getPipInfoText3.getText();
            console.error(`${message} text3: ${text3}`);
            let textNum3 = Number(truncateAndFormat(Number(text3.trim())));
            let textNum4 = Number(truncateAndFormat(Number(text4.trim())));
            expect(textNum3).assertEqual(textNum4);
            let stopPip3 = await driver.findComponent(ON.id('StopPiPWindow3'));
            await sleep(1000)
            await stopPip3.click();
            await terminateAbility(message);
            await sleep(1000)
            done()
          }
        }


      } catch (err) {
        console.error(`${message} Failed, Cause code ${err.code}, message ${err.message}`);
        if (err.code === 801) {
          done();
        } else {
          await terminateAbility(message);
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testPipWindowDefaultWindowSizeErrCode_0100
     * @tc.number testPipWindowDefaultWindowSizeErrCode_0100
     * @tc.desc   验证401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPipWindowDefaultWindowSizeErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testPipWindowDefaultWindowSizeErrCode_0100!'
      try {
        if (!isPipWindowEnabled) {
          done();
        } else {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController: XComponentController = new XComponentController();
          let navId: string = "page_1"; // 假设当前页面的导航id为page_1，详见PiPConfiguration定义，具体导航名称由开发者自行定义。
          let contentWidth: number = 800; // 假设当前内容宽度800px。
          let contentHeight: number = 600; // 假设当前内容高度600px。
          let config: pipWindow.PiPConfiguration = {
            context: globalThis.abilityContext,
            componentController: mXComponentController,
            navigationId: navId,
            templateType: pipWindow.PiPTemplateType.VIDEO_PLAY,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
            defaultWindowSizeType: 3
          };
          let promise: Promise<pipWindow.PiPController> = pipWindow.create(config);
          promise.then(async (data: pipWindow.PiPController) => {
            pipController = data;
            console.info(`${message} Succeeded in creating pip controller. Data:${data}`);
            console.error(`Succeeded startPiP`);
            expect().assertFail();
            done()
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to create pip controller. Cause:${err.code}, message:${err.message}`);
            expect().assertFail();
            done();
          });
        }

      } catch (err) {
        console.error(`${message} Failed, Cause code ${err.code}, message ${err.message}`);
        if (err.code === 801) {
          expect(err.message != null).assertTrue();
          done();
        } else {
          expect(err.code).assertEqual(401);
          expect(err.message != null).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   testGetPiPSettingSwitchStatus
     * @tc.number SUB_BASIC_WMS_GETPIPSETTINGSWITCH_0100
     * @tc.desc   验证支持画中画的设备调用getpipsettingswitch接口，获取设置中自动启动画中画按钮状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPiPSettingSwitchStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testGetPiPSettingSwitchStatus!'
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

            done();
          } else {
            console.log(`${message} Succeeded in creating pip controller, Data:${data}`)
            pipController.getPiPSettingSwitch().then((result: boolean) => {
              console.log(`${message} result: ${result}`)
              expect(result).assertEqual(true);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${message} promise Failed getPiPSettingSwitch, Cause code ${err.code}, message ${err.message}`);
              expect(err.code).assertEqual(801);
              expect(err.message != null).assertTrue();
              done();
            });
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to create pipcontroller, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${message} Failed to test updateContentSize, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPipHandleId
     * @tc.number SUB_BASIC_WMS_PIP_HANDLEID_0100
     * @tc.desc   testPipHandleId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPipHandleId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testPipHandleId!'
      try {
        if (!isPipWindowEnabled) {
          done();
        } else {
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
            handleId: 1
          };
          pipController = await pipWindow.create(config);

          done();
        }
      } catch (err) {
        console.error(`${message} Failed, Cause code ${err.code}, message ${err.message}`);
        if (err.code === 801) {
          expect(err.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined
     * @tc.number SUB_BASIC_WMS_PIP_CORNERADSORPTIONENABLED_0100
     * @tc.desc   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_undefined';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
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
          cornerAdsorptionEnabled: undefined
        };
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            await pipController.stopPiP();
            done();
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.name   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false
     * @tc.number SUB_BASIC_WMS_PIP_CORNERADSORPTIONENABLED_0200
     * @tc.desc   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_false';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
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
          cornerAdsorptionEnabled: false
        };
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            await pipController.stopPiP();
            done();
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.name   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true
     * @tc.number SUB_BASIC_WMS_PIP_CORNERADSORPTIONENABLED_0300
     * @tc.desc   OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'OH_PictureInPicture_PiPConfiguration_cornerAdsorptionEnabled_true';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
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
          cornerAdsorptionEnabled: true
        };
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            await pipController.stopPiP();
            await sleep(5000);
            done();
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testPiPStateChangeRequestStart
     * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_REQUESTSTART_0100
     * @tc.desc   testPiPStateChangeRequestStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPStateChangeRequestStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPStateChangeRequestStart';
      console.log(tag + caseName + ' begin');
      if (!isPipWindowEnabled) {
        done()
      } else {
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
          cornerAdsorptionEnabled: true
        };
        try {
          const callback = async (state: pipWindow.PiPState, reason: string) => {
            console.log(caseName + ' callback state: ' + state);
            console.log(caseName + ' callback reason: ' + reason);
            expect(reason).assertEqual('requestStart');
            pipController?.off('stateChange')
            await pipController?.stopPiP();
            done();
          }
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            pipController.on('stateChange', callback)
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            await sleep(3000);
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.off('stateChange')
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testPiPStateChangeAutoStart
     * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_AUTOSTART_0100
     * @tc.desc   testPiPStateChangeAutoStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPStateChangeAutoStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPStateChangeAutoStart';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled && isPCStatus != '') {
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
          cornerAdsorptionEnabled: true
        };
        try {
          let windowClass = windowStage.getMainWindowSync();
          const callback = async (state: pipWindow.PiPState, reason: string) => {
            console.log(caseName + ' callback state: ' + state);
            console.log(caseName + ' callback reason: ' + reason);
            expect(reason).assertEqual('autoStart')
            pipController?.off('stateChange')
            await pipController?.stopPiP();
            await windowClass.restore();
            done();
          }
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            pipController.on('stateChange', callback)
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            pipController.setAutoStartEnabled(true)
            await windowClass.minimize();
            await sleep(1000);
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause + JSON.stringify(err.code)+':msg:'+JSON.stringify(err.message)`);
            pipController?.off('stateChange')
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testPiPStateChangeRequestDelete
     * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_REQUESTDELETE_0100
     * @tc.desc   testPiPStateChangeRequestDelete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPStateChangeRequestDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPStateChangeRequestDelete';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
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
          cornerAdsorptionEnabled: true
        };
        try {
          const callback = (state: pipWindow.PiPState, reason: string) => {
            console.log(caseName + ' callback state: ' + state);
            console.log(caseName + ' callback reason: ' + reason);
            expect(reason).assertEqual('requestDelete')
            pipController?.off('stateChange')
            done();
          }
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP()
            pipController.on('stateChange', callback)
            await pipController.stopPiP();
            await sleep(3000);
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.off('stateChange')
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testPiPStateChangePanelActionDelete
     * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_PANELACTIONDELETE_0100
     * @tc.desc   testPiPStateChangePanelActionDelete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPStateChangePanelActionDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPStateChangePanelActionDelete';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
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
          cornerAdsorptionEnabled: true
        };
        let driver = Driver.create();
        try {
          const callback = (state: pipWindow.PiPState, reason: string) => {
            console.log(caseName + ' callback state: ' + state);
            console.log(caseName + ' callback reason: ' + reason);
            expect(reason).assertEqual('panelActionDelete');
            pipController?.off('stateChange')
            done();
          }
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            console.log(`${tag} ${caseName} Succeeded in start pip controller.`);
            await sleep(1000)
            pipController.on('stateChange', callback)
            let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            console.log(`${caseName} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
            await pipWindowComponent.click();
            await sleep(1000)
            let exit = await driver.findComponent(ON.id('control_exit'));
            await sleep(1000)
            await exit.click();
            await sleep(1000);
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.off('stateChange')
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })


    /**
     * @tc.name   testPiPStateChangePanelActionRestore
     * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_PANELACTIONRESTORE_0100
     * @tc.desc   testPiPStateChangePanelActionRestore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPStateChangePanelActionRestore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPStateChangePanelActionRestore';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
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
          cornerAdsorptionEnabled: true
        };
        let driver = Driver.create();
        try {
          const callback = async (state: pipWindow.PiPState, reason: string) => {
            console.log(caseName + ' callback state: ' + state);
            console.log(caseName + ' callback reason: ' + reason);
            expect(reason).assertEqual('panelActionRestore')
            pipController?.off('stateChange')
            done();
          }
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP()
            pipController.on('stateChange', callback)
            let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            console.log(`${caseName} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
            await pipWindowComponent.click();
            await sleep(1000)
            let restore = await driver.findComponent(ON.id('control_restore'));
            await sleep(1000)
            await restore.click();
            await sleep(1000);
          }).catch((err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            pipController?.off('stateChange')
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })


    /**
     * @tc.name   testPiPStateChangeOtherwithTwoPiP
     * @tc.number SUB_WMS_PIP_WINDOW_PIPSTATE_OTHER_0200
     * @tc.desc   testPiPStateChangeOtherwithTwoPiP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPStateChangeOtherwithTwoPiP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPStateChangeOtherwithTwoPiP';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
        let pipController: pipWindow.PiPController | undefined = undefined;
        let pipController2: pipWindow.PiPController | undefined = undefined;
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
          cornerAdsorptionEnabled: true
        };
        try {
          const callback = async (state: pipWindow.PiPState, reason: string) => {
            console.log(caseName + ' callback state: ' + state);
            console.log(caseName + ' callback reason: ' + reason);
            expect(reason).assertEqual('other')
            pipController?.off('stateChange')
            await pipController2?.stopPiP();
            done();
          }
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP()
            pipController.on('stateChange', callback)
            pipController2 = await pipWindow.create(config);
            await pipController2.startPiP()
            await sleep(3000);
          }).catch(async (err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testPiPisPiPActiveStarted
     * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0100
     * @tc.desc   testPiPisPiPActiveStarted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPisPiPActiveStarted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPisPiPActiveStarted';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
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
          cornerAdsorptionEnabled: true
        };
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            let isPipActive = await pipController.isPiPActive();
            console.log(tag + caseName + ' isPipActive: ' + isPipActive);
            expect(isPipActive).assertEqual(true);
            await pipController.stopPiP();
            await sleep(5000);
            done();
          }).catch(async (err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testPiPisPiPActiveBeforeStart
     * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0200
     * @tc.desc   testPiPisPiPActiveBeforeStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPisPiPActiveBeforeStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPisPiPActiveBeforeStart';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
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
          cornerAdsorptionEnabled: true
        };
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            let isPipActive = await pipController.isPiPActive();
            console.log(tag + caseName + ' isPipActive: ' + isPipActive);
            expect(isPipActive).assertEqual(false);
            await sleep(5000);
            done();
          }).catch(async (err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();

              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testPiPisPiPActiveStoped
     * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0300
     * @tc.desc   testPiPisPiPActiveStoped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPisPiPActiveStoped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPisPiPActiveStoped';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled) {
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
          cornerAdsorptionEnabled: true
        };
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            await pipController.stopPiP();
            let isPipActive = await pipController.isPiPActive();
            console.log(tag + caseName + ' isPipActive: ' + isPipActive);
            expect(isPipActive).assertEqual(false);
            await sleep(5000);
            done();
          }).catch(async (err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

    /**
     * @tc.name   testPiPisPiPActiveSidebar
     * @tc.number SUB_WMS_PIP_WINDOW_ISPIPACTIVE_0400
     * @tc.desc   testPiPisPiPActiveSidebar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPiPisPiPActiveSidebar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testPiPisPiPActiveSidebar';
      console.log(tag + caseName + ' begin');
      if (isPipWindowEnabled && isFreeWindowMode == false) {
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
          cornerAdsorptionEnabled: true
        };
        let driver = Driver.create();
        try {
          pipWindow.create(config).then(async (data) => {
            pipController = data;
            console.log(`${tag} ${caseName} Succeeded in creating pip controller. Data:${data}`);
            expect(data != null).assertTrue();
            await pipController.startPiP();
            // 3、画中画拉到侧边条
            let pipWindowComponent = await driver.findComponent(ON.id('SCBPipSceneOverlay'));
            console.log(`${caseName} pipWindowComponent: ${JSON.stringify(pipWindowComponent)}`);
            await sleep(1000)
            let pipWindowCenter = await pipWindowComponent.getBoundsCenter();
            console.log(`${caseName} pipWindowCenter: ${JSON.stringify(pipWindowCenter)}`);
            let displayInfo = display.getDefaultDisplaySync();
            console.log(`${caseName} displayInfo: ${JSON.stringify(displayInfo)}`);
            let dragToX = pipWindowCenter.x + displayInfo.width;
            let dragToY = pipWindowCenter.y;
            await driver.drag(pipWindowCenter.x, pipWindowCenter.y, dragToX, dragToY);
            await sleep(3000);
            let isPipActive = await pipController.isPiPActive();
            console.log(tag + caseName + ' isPipActive: ' + isPipActive);
            expect(isPipActive).assertEqual(false);
            await pipController.stopPiP();
            await sleep(5000);
            done();
          }).catch(async (err: BusinessError) => {
            console.log(`${tag} ${caseName} Failed1 to create pip controller. Cause` + JSON.stringify(err.code) + ':msg:' + JSON.stringify(err.message));
            if (err.code == 801) {
              expect(err.message != null).assertTrue();
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.log(`${tag} ${caseName} Failed. Cause` + JSON.stringify(error.code) + ':msg:' + JSON.stringify(error.message));
          expect().assertFail();
          done();
        }
      } else {
        done()
      }
    })

  })
}

