/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import deviceInfo from '@ohos.deviceInfo';
import settings from '@ohos.settings';
import { image } from '@kit.ImageKit';
import { StartOptions } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import pipWindow from '@ohos.PiPWindow';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3',
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
  let windowStageStart = AppStorage.get('windowStageStartTest3') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility3(caseName: string) {
  let pageContext = AppStorage.get('contextTest3') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility4(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility4',
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
  let windowStageStart = AppStorage.get('windowStageStartTest4') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility4(caseName: string) {
  let pageContext = AppStorage.get('contextTest4') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function WindowEnterpriseTest() {
    describe('windowEnterpriseTest', () => {
        let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
        let context: common.UIAbilityContext;
        let windowStage: ohosWindow.WindowStage;
        let isAutoWindow: string = '';
        let isPCStatus: string = '';
        beforeAll(() => {
            context = AppStorage.get('context') as common.UIAbilityContext;
            console.log('windowTest context: ' + JSON.stringify(context))
            windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
            isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
            console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            console.info(`beforeAll isPCStatus: `+ isPCStatus);


        })
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
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
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })
       
     
    /**
     * @tc.number    : SUB_BASIC_WMS_GET_VISIBLEWINDOWINFO_0100
     * @tc.name      : test_GET_VISIBLEWINDOWINFO_0100
     * @tc.desc      : test_GET_VISIBLEWINDOWINFO_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_GET_VISIBLEWINDOWINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_GET_VISIBLEWINDOWINFO_0100 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility3(caseName, context);
      try {
        let windowClass2 = windowStageStart.getMainWindowSync();
        let res = windowClass2.getWindowProperties()
        console.info(caseName + 'res: ' + JSON.stringify(res));
        window.getVisibleWindowInfo().then(async (infos: Array<window.WindowInfo>) => {
          console.info(caseName + 'Succeeded in calling getVisibleWindowInfo.');
          console.info(caseName + `infos.length: ${infos.length}`);
          expect(infos.length).assertLargerOrEqual(1);
          let isExit = false;
          for (let i = 0; i < infos.length; i++) {
            if (infos[i].windowId === res.id) {
              isExit = true;
              let info = infos[i];
              console.info(caseName + 'info: ' + JSON.stringify(info));
              expect(info.rect.left).assertEqual(res.windowRect.left);
              expect(info.rect.top).assertEqual(res.windowRect.top);
              expect(info.rect.width).assertEqual(res.windowRect.width);
              expect(info.rect.height).assertEqual(res.windowRect.height);
              expect(info.isFocused).assertEqual(true);
              console.info(caseName + `info.windowStatusType: ${info.windowStatusType}`);
              console.info(caseName + `info.bundleName: ${info.bundleName}`);
              console.info(caseName + `info.abilityName: ${info.abilityName}`);
              break;
            }
          }
          if (!isExit) {
            console.error(`${caseName} failed, there is no match windowId.`);
            await terminateAbility3(caseName);
            expect().assertFail();
            done()
          }
          await terminateAbility3(caseName);
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
          await terminateAbility3(caseName);
          expect().assertFail();
          done();
        });
      } catch (err) {
        await terminateAbility3(caseName);
        console.log(`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
            console.log(`${caseName} deviceType does not supported this Capability`);
            done()
          } else {
            expect().assertFail();
            done();
          }
      }
    });

      /**
       * @tc.number    : SUB_BASIC_WMS_FUNCTION_GET_GLOBAL_RECT_0200
       * @tc.name      : testGetVisibleWindowInfo
       * @tc.desc      : 验证getVisibleWindowInfo接口可以正常获取到窗口的全局坐标
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetVisibleWindowInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let caseName: string = 'testGetVisibleWindowInfo ';
        console.log(caseName + 'begin');

        let WindowStart = await startAbility3(caseName, context);
        let windowClass = WindowStart.getMainWindowSync();
        await sleep(300);
        try {
          await sleep(200);
          let windowClassProperties = windowClass.getWindowProperties();
          console.log(`${caseName} : windowClassProperties: ${JSON.stringify(windowClassProperties)}`);
          window.getVisibleWindowInfo().then(async (infos: Array<window.WindowInfo>) => {
            console.info(caseName + 'Succeeded in calling getVisibleWindowInfo.'+JSON.stringify(infos));

            let isExit = false;
            for (let i = 0; i < infos.length; i++) {
              console.info(caseName + 'info: '+i+':' + JSON.stringify(infos[i]));
              if (infos[i].windowId === windowClassProperties.id) {
                isExit = true;
                let info = infos[i].globalDisplayRect;
                console.info(caseName + 'info: ' + JSON.stringify(info));
                expect(info?.left).assertEqual(windowClassProperties.windowRect.left);
                expect(info?.top).assertEqual(windowClassProperties.windowRect.top);
                expect(info?.width).assertEqual(windowClassProperties.windowRect.width);
                expect(info?.height).assertEqual(windowClassProperties.windowRect.height);
                break;
              }
            }
            if (!isExit) {
              console.error(`${caseName} failed, there is no match windowId.`);
              expect().assertFail();
              await terminateAbility3(caseName);
              done()
            }else{

              await terminateAbility3(caseName);
              expect(true).assertTrue();
              done();
            }


          }).catch(async (err: BusinessError) => {
            console.error(caseName + 'Failed to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
            await terminateAbility3(caseName);
            expect().assertFail();
            done();
          });
        } catch (err) {
          await terminateAbility3(caseName);
          console.log(`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
          expect(err.message!=null).assertTrue();
          if (err.code === 801) {
            console.log(`${caseName} deviceType does not supported this Capability`);
            done()
          } else {
            expect().assertFail();
            done();
          }
        }
      });

    })
}

