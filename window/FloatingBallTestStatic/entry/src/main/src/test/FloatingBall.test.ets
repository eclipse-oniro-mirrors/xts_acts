/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import floatingBall from '@ohos.window.floatingBall';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '../../../hypium/index';
import { BusinessError, Callback } from '@ohos.base';
import { common, Want } from '@kit.AbilityKit';
import window from '@ohos.window';
import settings from '@ohos.settings';
import image from '@ohos.multimedia.image'
import { Driver, ON, Component, Rect } from '@kit.TestKit';
import { abilityAccessCtrl, StartOptions ,PermissionRequestResult, Permissions} from '@kit.AbilityKit';
import { display, screenshot } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

async function getPermision(): Promise<void> {
  let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context : common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
  let permissions: Array<Permissions> =
    ["ohos.permission.CUSTOM_SCREEN_CAPTURE"];
  try {
    let data: PermissionRequestResult = await atManager.requestPermissionsFromUser(context, permissions);
    console.error('capture requestPermissionsFromUser success: ' + JSON.stringify(data));
  } catch (err) {
    console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
  }
}

async function clickButtonDriver(){
  console.error(`come in permissionClick`);
  let driver: Driver = Driver.create();
  console.error(`come in Driver create`);
  let buttonOne: Component | null = await driver.findComponent(ON.text('允许'));
  console.error(`buttonOne is ${JSON.stringify(buttonOne)}`);
  if(buttonOne!=null){
    await buttonOne.click();
  }

}

export default function FloatingBallTest() {
  describe('FloatingBallTest', (): void => {
    hilog.info(domain, tag, 'FloatingBallTest start');
    let abilityDelegator : abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let isFloatingBallEnabled: boolean = false;
    let context : common.UIAbilityContext;
    let isPCStatus:string = '';
    let isAutoWindow:string = '';
    let windowStage:window.WindowStage;
    let win: window.Window;
    let driver:Driver;
    let pixelMapIcon:image.PixelMap|undefined;
    let pixelMapIcon1:image.PixelMap|undefined;
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswindowtest.static")
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      await Utils.msSleep(2000);
      driver = Driver.create();
      console.info('beforeAll Driver.create ');
      isFloatingBallEnabled = floatingBall.isFloatingBallEnabled();
      console.info('beforeAll Floating ball enabled is: ' + isFloatingBallEnabled);
      windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
      hilog.info(domain, tag, 'jsUnittest beforeAll windowStage =' + windowStage);
      win = AppStorage.get<window.Window>('mainWindow') as window.Window;
      hilog.info(domain, tag, 'jsUnittest beforeAll win =' + win);
      context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      hilog.info(domain, tag, 'jsUnittest beforeAll context =' + context);
      // isPCStatus = settings.getValueSync(context,'isStatusBarExist','',settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      // console.info(`beforeAll isPCStatus: ${isPCStatus}`);
      // isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      // console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      let name:string = 'icon';
      try{
        const file: Uint8Array= await context.resourceManager.getMediaByName(name);
        const imageSource:image.ImageSource|undefined = image.createImageSource((file.buffer as ArrayBuffer));
        console.log(` beforeAll createImageSource success：${JSON.stringify(imageSource)}`);
        pixelMapIcon = await imageSource!.createPixelMap();
      }catch (err: BusinessError) {
        console.error(` beforeAll pixelMapIcon failed. Cause:${err.code}, message:${err.message}`);
      }

      let name1:string = 'icon1'
      try{
        const file1: Uint8Array= await context.resourceManager.getMediaByName(name1);
        const imageSource1:image.ImageSource|undefined = image.createImageSource((file1.buffer as ArrayBuffer));
        console.log(` beforeAll createImageSource1 success：${JSON.stringify(imageSource1)}`);
        pixelMapIcon1 = await imageSource1!.createPixelMap();
      }catch (err: BusinessError) {
        console.error(` beforeAll getPixelMap1 failed. Cause:${err.code}, message:${err.message}`);
      }

      getPermision();
      await Utils.msSleep(300);
      clickButtonDriver();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(800);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   test_FloatingBallTemplate_Enum
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0100
     * @tc.desc   test_FloatingBallTemplate_Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FloatingBallTemplate_Enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      let CaseName:string = 'test_FloatingBallTemplate_Enum';
      console.log(CaseName + ' floatingBall.FloatingBallTemplate.STATIC: '+floatingBall.FloatingBallTemplate.STATIC);
      console.log(CaseName + ' floatingBall.FloatingBallTemplate.NORMAL: '+floatingBall.FloatingBallTemplate.NORMAL);
      console.log(CaseName + ' floatingBall.FloatingBallTemplate.EMPHATIC: '+floatingBall.FloatingBallTemplate.EMPHATIC);
      console.log(CaseName +  'floatingBall.FloatingBallTemplate.SIMPLE: '+floatingBall.FloatingBallTemplate.SIMPLE);
      expect(floatingBall.FloatingBallTemplate.STATIC).assertEqual(1);
      expect(floatingBall.FloatingBallTemplate.NORMAL).assertEqual(2);
      expect(floatingBall.FloatingBallTemplate.EMPHATIC).assertEqual(3);
      expect(floatingBall.FloatingBallTemplate.SIMPLE).assertEqual(4);
      done();
    })
    /**
     * @tc.name   test_FloatingBallState_Enum
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0200
     * @tc.desc   test_FloatingBallState_Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FloatingBallState_Enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      let CaseName:string = 'test_FloatingBallState_Enum';
      console.log(CaseName + ' floatingBall.FloatingBallState.STARTED: '+floatingBall.FloatingBallState.STARTED);
      console.log(CaseName + ' floatingBall.FloatingBallState.STOPPED: '+floatingBall.FloatingBallState.STOPPED);
      expect(floatingBall.FloatingBallState.STARTED).assertEqual(1);
      expect(floatingBall.FloatingBallState.STOPPED).assertEqual(2);
      done();
    })
    // /**
    //  * @tc.name   test_Create_1300019
    //  * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0300
    //  * @tc.desc   test Wrong parameters
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL3
    //  */
    // it('test_Create_1300019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    //   let CaseName:string = 'test_Create_1300019';
    //   let context1:common.UIAbilityContext;
    //   let config: floatingBall.FloatingBallConfiguration = {
    //     context: context1,
    //   };
    //   try {
    //     floatingBall.create(config).then((data: floatingBall.FloatingBallController) => {
    //       let floatingBallController: floatingBall.FloatingBallController = data;
    //       console.info(CaseName+ ` Succeeded in creating floating ball controller. Data: ${data}`);
    //       expect(false).assertTrue();
    //       done();
    //     }).catch((err: Error):void => {
    //       console.error(CaseName+ ` Failed to create floating ball controller. Cause:${err.code}, message:${err.message}`);
    //       expect(err.message!=null).assertTrue();
    //       expect(false).assertTrue();
    //       done();
    //     });
    //   } catch (error) {
    //     let exception: BusinessError = error as BusinessError;
    //     console.error( CaseName+  `Failed to test_Create_1300019. Cause:${exception.code}, message:${exception.message}`);
    //     expect(exception.code).assertEqual(1300019);
    //     expect(exception.message!=null).assertTrue();
    //     done();
    //   }
    // })

    /**
     * @tc.name   test_Create_oneFloatingBall
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0400
     * @tc.desc   test_Create_oneFloatingBall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_Create_oneFloatingBall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_Create_oneFloatingBall';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };

      let issupportFloatingBall: boolean = floatingBall.isFloatingBallEnabled();
      try {
        floatingBall.create(config).then((data: floatingBall.FloatingBallController) => {
          let floatingBallController: floatingBall.FloatingBallController = data;
          console.info(CaseName+ ` Succeeded in creating floating ball controller. Data: ${data}`);
          floatingBallController.startFloatingBall(startParams).then(() => {
            console.info(CaseName+' Succeeded in starting floating ball.');
            expect(issupportFloatingBall).assertEqual(true);
            floatingBallController.stopFloatingBall().then(() => {
              console.info(CaseName+ 'Succeeded in stopping floating ball.');
              expect(true).assertTrue();
              done();
            }).catch((err: Error):void => {
              console.error(CaseName+ `Failed to stop floating ball. Cause:${err.code}, message:${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
            expect(false).assertTrue();
            done();
          });

        }).catch((err: Error):void => {
          console.error(CaseName+ ` Failed to create floating ball controller. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          if(err.code == 801){
            expect(issupportFloatingBall).assertEqual(false);
            done();
          }else{
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_Create_MultFloatingBall
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0500
     * @tc.desc   test_Create_MultFloatingBall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_Create_MultFloatingBall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_Create_MultFloatingBall';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      try {
        let floatingBallController1: floatingBall.FloatingBallController = await floatingBall.create(config);
        let floatingBallController2: floatingBall.FloatingBallController = await floatingBall.create(config);
        let floatingBallController3: floatingBall.FloatingBallController = await floatingBall.create(config);
        console.info(CaseName+ ` Succeeded in creating floating ball controller. floatingBallController1: ${floatingBallController1}
        ,floatingBallController2: ${floatingBallController2},floatingBallController3: ${floatingBallController3}`);
        expect((floatingBallController1!=null) && (floatingBallController2!=null) && (floatingBallController3!=null)).assertTrue();
        done();
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_startFloatingBall_1300019
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0600
     * @tc.desc   test_startFloatingBall_1300019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_1300019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_1300019';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      try {
        floatingBall.create(config).then((data: floatingBall.FloatingBallController) => {
          let floatingBallController: floatingBall.FloatingBallController = data;
          console.info(CaseName+ ` Succeeded in creating floating ball controller. Data: ${data}`);
          floatingBallController.startFloatingBall({ template: floatingBall.FloatingBallTemplate.STATIC, title: '' } as floatingBall.FloatingBallParams).then(() => {
            console.info(CaseName+' Succeeded in starting floating ball.');
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.message!=null).assertTrue();
            if(err.code == 1300019){
              expect(true).assertTrue();
              done();
            }
            else{
              expect(false).assertTrue();
              done();
            }
          });

        }).catch((err: Error):void => {
          console.error(CaseName+ ` Failed to create floating ball controller. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          if(err.code == 801){
            done();
          }else{
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_startFloatingBall_1300021
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0700
     * @tc.desc   test_startFloatingBall_1300021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_1300021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_1300021';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      try {
        let floatingBallController1: floatingBall.FloatingBallController = await floatingBall.create(config);
        let floatingBallController2: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController1.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController1 Succeeded in starting floating ball.');
          floatingBallController2.startFloatingBall(startParams).then(() => {
            console.info(CaseName+' floatingBallController2 Succeeded in starting floating ball.');
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
            await floatingBallController1.stopFloatingBall();
            expect(err.code).assertEqual(1300021);
            expect(err.message!=null).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController1 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });


      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_1300022
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_0800
     * @tc.desc   test_startFloatingBall_1300022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_1300022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_1300022';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      try {
        let floatingBallController1: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController1.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController1 Succeeded  1 in starting floating ball.');
          floatingBallController1.startFloatingBall(startParams).then(() => {
            console.info(CaseName+' floatingBallController Succeeded 2 in starting floating ball.');
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
            await floatingBallController1.stopFloatingBall();
            expect(err.code).assertEqual(1300022);
            expect(err.message!=null).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController1 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
          done();
        });


      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })



    
    /**
     * @tc.name   test_startFloatingBall_title_null
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1100
     * @tc.desc   test_startFloatingBall_title_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_title_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_title_null';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };

      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: '',
        icon:pixelMapIcon as image.PixelMap
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          if(err.code == 1300019){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_title_more_than_64
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1200
     * @tc.desc   title超过64字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_title_more_than_64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_title_more_than_64';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };

      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        icon:pixelMapIcon as image.PixelMap
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          if(err.code == 1300019){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_content_more_than_64
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1300
     * @tc.desc   test_startFloatingBall_content_more_than_64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_content_more_than_64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_content_more_than_64';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };

      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        content:'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          if(err.code == 1300019){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_content_null
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1400
     * @tc.desc   content 传入 ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_content_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_content_null';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        content:'',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }
        else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_backgroundColor_FF0000FF
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1500
     * @tc.desc   backgroundColor带透明度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_backgroundColor_FF0000FF', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_backgroundColor_FF0000FF';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#80FFFFFF'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          if(err.code == 1300019){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_backgroundColor_invalid_string
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1600
     * @tc.desc   backgroundColor传入无效字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_backgroundColor_invalid_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_backgroundColor_invalid_string';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };

      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'123'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          if(err.code == 1300019){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_STATIC_5_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1700
     * @tc.desc   test_startFloatingBall_STATIC_5_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_startFloatingBall_STATIC_5_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_STATIC_5_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        content: 'content',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })

    /**
     * @tc.name   test_startFloatingBall_STATIC_4_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1800
     * @tc.desc   test_startFloatingBall_STATIC_4_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_STATIC_4_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_STATIC_4_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        content: 'content',
        icon:pixelMapIcon as image.PixelMap
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_STATIC_3_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_1900
     * @tc.desc   test_startFloatingBall_STATIC_3_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_STATIC_3_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_STATIC_3_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_STATIC_No_icon
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2000
     * @tc.desc   test_startFloatingBall_STATIC_No_icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_STATIC_No_icon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_STATIC_No_icon';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          if(err.code == 1300019){
            expect(true).assertTrue();
            done();
          }
          else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_NORMAL_5_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2100
     * @tc.desc   test_startFloatingBall_NORMAL_5_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_NORMAL_5_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_NORMAL_5_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title',
        content: 'content',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })

    /**
     * @tc.name   test_startFloatingBall_NORMAL_4_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2200
     * @tc.desc   test_startFloatingBall_NORMAL_4_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_NORMAL_4_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_NORMAL_4_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title',
        content: 'content',
        icon:pixelMapIcon as image.PixelMap
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_NORMAL_3_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2300
     * @tc.desc   test_startFloatingBall_NORMAL_3_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_NORMAL_3_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_NORMAL_3_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_NORMAL_2_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2400
     * @tc.desc   test_startFloatingBall_NORMAL_2_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_startFloatingBall_NORMAL_2_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_NORMAL_2_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_EMPHATIC_5_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2500
     * @tc.desc   test_startFloatingBall_EMPHATIC_5_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_EMPHATIC_5_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_EMPHATIC_5_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })

    /**
     * @tc.name   test_startFloatingBall_EMPHATIC_4_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2600
     * @tc.desc   test_startFloatingBall_EMPHATIC_4_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_EMPHATIC_4_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_EMPHATIC_4_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content',
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_EMPHATIC_3_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2700
     * @tc.desc   test_startFloatingBall_EMPHATIC_3_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_startFloatingBall_EMPHATIC_3_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_EMPHATIC_3_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_EMPHATIC_2_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2800
     * @tc.desc   test_startFloatingBall_EMPHATIC_2_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_startFloatingBall_EMPHATIC_2_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_EMPHATIC_2_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_SIMPLE_5_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_2900
     * @tc.desc   test_startFloatingBall_SIMPLE_5_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_SIMPLE_5_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_SIMPLE_5_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
        content: 'content',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })

    /**
     * @tc.name   test_startFloatingBall_SIMPLE_4_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3000
     * @tc.desc   test_startFloatingBall_SIMPLE_4_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_startFloatingBall_SIMPLE_4_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_SIMPLE_4_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_SIMPLE_3_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3100
     * @tc.desc   test_startFloatingBall_SIMPLE_3_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_SIMPLE_3_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_SIMPLE_3_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
        backgroundColor:'#008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_startFloatingBall_SIMPLE_2_Params
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3200
     * @tc.desc   test_startFloatingBall_SIMPLE_2_Params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_startFloatingBall_SIMPLE_2_Params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_SIMPLE_2_Params';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController2 Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_updateFloatingBall_1300019
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3300
     * @tc.desc   title is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_1300019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_1300019';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title'
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: ''
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            floatingBallController.stopFloatingBall();
            expect(err.code).assertEqual(1300019)
            expect(err.message!=null).assertTrue();
            done()
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   test_updateFloatingBall_1300025
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3400
     * @tc.desc   not start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_1300025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_1300025';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title'
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title2'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.updateFloatingBall(updateParams).then(() => {
          console.info(CaseName+ ' Succeeded in updating floating ball.');
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(err.code).assertEqual(1300025);
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   test_updateFloatingBall_STATIC_NORMAL
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3500
     * @tc.desc   test_updateFloatingBall_STATIC_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_STATIC_NORMAL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_STATIC_NORMAL';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title2'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            floatingBallController.stopFloatingBall();
            expect(err.code).assertEqual(1300028)
            expect(err.message!=null).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          floatingBallController.stopFloatingBall();
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   test_updateFloatingBall_NORMAL_EMPHATIC
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3600
     * @tc.desc   test_updateFloatingBall_NORMAL_EMPHATIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_NORMAL_EMPHATIC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_NORMAL_EMPHATIC';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title'
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title2'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            floatingBallController.stopFloatingBall();
            expect(err.code).assertEqual(1300027)
            expect(err.message!=null).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   test_updateFloatingBall_STATIC
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3700
     * @tc.desc   test_updateFloatingBall_STATIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_STATIC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_STATIC';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.STATIC,
        title: 'title2',
        icon:pixelMapIcon1 as image.PixelMap,
        backgroundColor:'#FF008EF5',
        content:'content'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            floatingBallController.stopFloatingBall();
            expect(err.code).assertEqual(1300028)
            expect(err.message!=null).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   test_updateFloatingBall_NORMAL
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3800
     * @tc.desc   test_updateFloatingBall_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_NORMAL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_NORMAL';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#FF008E',
        content:'content'
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.NORMAL,
        title: 'title2',
        icon:pixelMapIcon1 as image.PixelMap,
        backgroundColor:'#FF008EF5',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(true).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.message!=null).assertTrue();
            expect(false).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   test_updateFloatingBall_EMPHATIC
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_3900
     * @tc.desc   test_updateFloatingBall_EMPHATIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_EMPHATIC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_EMPHATIC';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#FF008E',
        content:'content'
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title2',
        icon:pixelMapIcon1 as image.PixelMap,
        backgroundColor:'#FF008EF5',
        content:'content1'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(true).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.message!=null).assertTrue();
            expect(false).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   test_updateFloatingBall_SIMPLE
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4000
     * @tc.desc   test_updateFloatingBall_SIMPLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_updateFloatingBall_SIMPLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_updateFloatingBall_SIMPLE';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
        icon:pixelMapIcon as image.PixelMap,
        backgroundColor:'#FF008EF5',
        content:'content'
      };
      let updateParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title2',
        icon:pixelMapIcon1 as image.PixelMap,
        backgroundColor:'#FF008EF5',
        content:'content1'
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.updateFloatingBall(updateParams).then(() => {
            console.info(CaseName+ ' Succeeded in updating floating ball.');
            floatingBallController.stopFloatingBall();
            expect(true).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to update floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.message!=null).assertTrue();
            expect(false).assertTrue();
            done();
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_stopFloatingBall_1300022
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4100
     * @tc.desc   Repeated stopFloatingBall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_stopFloatingBall_1300022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_stopFloatingBall_1300022';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall().then(() => {
            console.info(CaseName+ ' Succeeded in stopping 1 floating ball.');
            floatingBallController.stopFloatingBall().then(() => {
              console.info(CaseName+ ' Succeeded in stopping 2 floating ball.');
            }).catch((err: Error):void => {
              console.error(CaseName+ ` Failed to stop 2 floating ball. Cause:${err.code}, message:${err.message}`);
              expect(err.code).assertEqual(1300022);
              expect(err.message!=null).assertTrue();
              done();
            });
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to stop 1 floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.message!=null).assertTrue();
            expect(false).assertTrue();
            done()
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_stopFloatingBall_1300024
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4200
     * @tc.desc   not start FloatingBall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_stopFloatingBall_1300024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_stopFloatingBall_1300024';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.stopFloatingBall().then(() => {
          console.info(CaseName+ ' Succeeded in stopping 2 floating ball.');
        }).catch((err: Error):void => {
          console.error(CaseName+ ` Failed to stop 2 floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(1300024);
          expect(err.message!=null).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_startFloatingBall_after_stop
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4300
     * @tc.desc   test_startFloatingBall_after_stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_after_stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_startFloatingBall_after_stop';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.stopFloatingBall().then(() => {
            console.info(CaseName+ ' Succeeded in stopping 1 floating ball.');
            await Utils.msSleep(800);
            floatingBallController.startFloatingBall(startParams).then(() => {
              console.info(CaseName+ ' Succeeded in starting 2 floating ball.');
              floatingBallController.stopFloatingBall().then(() => {
                console.info(CaseName+ ' Succeeded in stopping 2 floating ball.');
                expect(true).assertTrue();
                done()
              }).catch((err: Error):void => {
                console.error(CaseName+ ` Failed to stop 2 floating ball. Cause:${err.code}, message:${err.message}`);
                expect(err.message!=null).assertTrue();
                expect(false).assertTrue();
                done()
              });
            }).catch((err: Error):void => {
              console.error(CaseName+ ` Failed to starting 2 floating ball. Cause:${err.code}, message:${err.message}`);
              expect(err.message!=null).assertTrue();
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error):void => {
            console.error(CaseName+ ` Failed to stop 1 floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.message!=null).assertTrue();
            expect(false).assertTrue();
            done()
          });
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_on_stateChange_1300022
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4400
     * @tc.desc   Repeated on_stateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_stateChange_1300022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_stateChange_1300022';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let onStateChange: Callback<floatingBall.FloatingBallState> = (state: floatingBall.FloatingBallState) => {
        console.info(CaseName+ ' Floating ball stateChange: ' + state);
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.onStateChange(onStateChange);
          floatingBallController.onStateChange(onStateChange);
          expect(false).assertTrue();
          done()
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          floatingBallController.stopFloatingBall();
          floatingBallController.offStateChange(onStateChange);
          expect(err.code).assertEqual(1300022);
          expect(err.message!=null).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_on_stateChange_start_stop
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4500
     * @tc.desc   test_on_stateChange_start_stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_stateChange_start_stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_stateChange_start_stop';
      let FloatBallstate:number = 0;
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let onStateChange: Callback<floatingBall.FloatingBallState> = (state: floatingBall.FloatingBallState) => {
        console.info(CaseName+ ' Floating ball stateChange: ' + state);
        FloatBallstate = state;
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.onStateChange(onStateChange);
        await floatingBallController.startFloatingBall(startParams);
        await Utils.msSleep(200);
        expect(FloatBallstate).assertEqual(floatingBall.FloatingBallState.STARTED);
        floatingBallController.stopFloatingBall();
        await Utils.msSleep(800);
        expect(FloatBallstate).assertEqual(floatingBall.FloatingBallState.STOPPED);
        floatingBallController.offStateChange();
        done();
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_on_stateChange_two_callback
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4600
     * @tc.desc   注册两个监听，收到两次回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_stateChange_two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_stateChange_two_callback';
      let time:number = 0;
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let callback1: Callback<floatingBall.FloatingBallState> = (state: floatingBall.FloatingBallState) => {
        console.info(CaseName+ 'callback1 Floating ball stateChange: ' + state);
        time++;
        console.info(CaseName+ 'callback1 time: ' + time);
      };
      let callback2: Callback<floatingBall.FloatingBallState> = (state: floatingBall.FloatingBallState) => {
        console.info(CaseName+ ' callback2 Floating ball stateChange: ' + state);
        time++;
        console.info(CaseName+ 'callback2 time: ' + time);
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.onStateChange(callback1);
        floatingBallController.onStateChange(callback2);
        await floatingBallController.startFloatingBall(startParams);
        await Utils.msSleep(200);
        console.info(CaseName+ ' time1: ' + time);
        expect(time).assertEqual(2);
        floatingBallController.offStateChange();
        floatingBallController.stopFloatingBall();
        await Utils.msSleep(800);
        console.info(CaseName+ ' time2: ' + time);
        expect(time).assertEqual(2);
        done();
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_on_stateChange_off_callback1
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4700
     * @tc.desc   取消callback1,收到callback2回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_stateChange_off_callback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_stateChange_off_callback1';
      let time:number = 0;
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let callback1: Callback<floatingBall.FloatingBallState> = (state: floatingBall.FloatingBallState) => {
        console.info(CaseName+ 'callback1 Floating ball stateChange: ' + state);
        time++;
        console.info(CaseName+ 'callback1 time: ' + time);
      };
      let callback2: Callback<floatingBall.FloatingBallState> = (state: floatingBall.FloatingBallState) => {
        console.info(CaseName+ ' callback2 Floating ball stateChange: ' + state);
        time++;
        console.info(CaseName+ 'callback2 time: ' + time);
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.onStateChange(callback1);
        floatingBallController.onStateChange(callback2);
        await floatingBallController.startFloatingBall(startParams);
        await Utils.msSleep(200);
        console.info(CaseName+ ' time1: ' + time);
        expect(time).assertEqual(2);
        floatingBallController.offStateChange(callback1);
        floatingBallController.stopFloatingBall();
        await Utils.msSleep(800);
        console.info(CaseName+ ' time2: ' + time);
        expect(time).assertEqual(3);
        floatingBallController.offStateChange();
        done();
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_on_click_1300022
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4800
     * @tc.desc   Repeated on_click
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_click_1300022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_click_1300022';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let onClick = () => {
        console.info(CaseName+ 'Floating ball onClick');
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.startFloatingBall(startParams).then(() => {
          console.info(CaseName+' floatingBallController Succeeded  in starting floating ball.');
          floatingBallController.onClick(onClick);
          floatingBallController.onClick(onClick);
          expect(false).assertTrue();
          done()
        }).catch((err: Error):void => {
          console.error(CaseName+ ` floatingBallController Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
          floatingBallController.stopFloatingBall();
          floatingBallController.offStateChange(onClick);
          expect(err.code).assertEqual(1300022);
          expect(err.message!=null).assertTrue();
          done()
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_on_click_two_callback
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_4900
     * @tc.desc   注册两个监听，收到两次回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_click_two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_click_two_callback';
      let time:number = 0;
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let callback1: Callback<void> = () => {
        console.info(CaseName+ 'callback1 Floating ball onClick..');
        time++;
        console.info(CaseName+ 'callback1 time: ' + time);
      };
      let callback2: Callback<void> = () => {
        console.info(CaseName+ 'callback2 Floating ball onClick..');
        time++;
        console.info(CaseName+ 'callback2 time: ' + time);
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        await Utils.msSleep(200);
        floatingBallController.onClick(callback1);
        floatingBallController.onClick(callback2);
        //点击
        let button: Component | null = await driver.findComponent(ON.id('FloatingBallSimpleTemplate'));
        console.info(CaseName+ ' button: ' + button);
        let Bounds: Rect = await  button!.getBounds();
        console.info(CaseName+ ' Bounds: ' + JSON.stringify(Bounds));
          await driver.click(Bounds.left,Bounds.top);
          await Utils.msSleep(300);
          console.info(CaseName+ ' time1: ' + time);
          expect(time).assertEqual(2);
          floatingBallController.offClick();
          //点击
          await driver.click(Bounds.left,Bounds.top);
          await Utils.msSleep(300);
          console.info(CaseName+ ' time2: ' + time);
          expect(time).assertEqual(2);

          floatingBallController.stopFloatingBall();
          await Utils.msSleep(800);
          done();


      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_on_click_off_callback1
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5000
     * @tc.desc   取消callback1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_click_off_callback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_on_click_off_callback1';
      let time:number = 0;
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let callback1: Callback<void> = () => {
        console.info(CaseName+ 'callback1 Floating ball onClick..');
        time++;
        console.info(CaseName+ 'callback1 time: ' + time);
      };
      let callback2: Callback<void> = () => {
        console.info(CaseName+ 'callback2 Floating ball onClick..');
        time++;
        console.info(CaseName+ 'callback2 time: ' + time);
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        await Utils.msSleep(200);
        floatingBallController.onClick(callback1);
        floatingBallController.onClick(callback2);
        //点击
        let button: Component | null = await driver.findComponent(ON.id('FloatingBallSimpleTemplate'));
        console.info(CaseName+ ' button: ' + button);

        let Bounds: Rect = await  button!.getBounds();
        console.info(CaseName+ ' Bounds: ' + JSON.stringify(Bounds));
        await driver.click(Bounds.left,Bounds.top);
        await Utils.msSleep(300);
        console.info(CaseName+ ' time1: ' + time);
        expect(time).assertEqual(2);
        floatingBallController.offClick(callback1);
        //点击
        await driver.click(Bounds.left,Bounds.top);
        await Utils.msSleep(300);
        console.info(CaseName+ ' time2: ' + time);
        expect(time).assertEqual(3);
        floatingBallController.offClick();
        floatingBallController.stopFloatingBall();
        await Utils.msSleep(200);
        done();
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_getFloatingBallWindowInfo_1300025
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5100
     * @tc.desc   test_getFloatingBallWindowInfo_1300025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getFloatingBallWindowInfo_1300025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_getFloatingBallWindowInfo_1300025';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.getFloatingBallWindowInfo().then((data: floatingBall.FloatingBallWindowInfo) => {
          console.info(CaseName+' Succeeded in getting floating ball window info. Info: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName + ` Failed to get floating ball window info. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300025)
          expect(err.message!=null).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_getFloatingBallWindowInfo
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5200
     * @tc.desc   test_getFloatingBallWindowInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getFloatingBallWindowInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_getFloatingBallWindowInfo';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let State: floatingBall.FloatingBallState
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        let onStateChangeCallback = (state: floatingBall.FloatingBallState) => {
          console.info(CaseName+ ' Floating ball stateChange: ' + state);
          State = state;

        };
        floatingBallController.onStateChange(onStateChangeCallback);
        await floatingBallController.startFloatingBall(startParams);
        await Utils.msSleep(1000);
        console.info(CaseName+ ' Floating ball State: ' + State);
        if(State == floatingBall.FloatingBallState.STARTED){
          floatingBallController.getFloatingBallWindowInfo().then((data: floatingBall.FloatingBallWindowInfo) => {
            console.info(CaseName+' Succeeded in getting floating ball window info. Info: ' + JSON.stringify(data.windowId));
            floatingBallController.offStateChange(onStateChangeCallback);
            floatingBallController.stopFloatingBall();
            expect(data.windowId).assertLarger(0);
            expect(data!=null).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName + ` Failed to get floating ball window info. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.message!=null).assertTrue();
            expect(false).assertTrue();
            done();
          });
        }else{
          console.info(CaseName+ ' Floating ball state is not STARTED');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_restoreMainWindow_1300019
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5300
     * @tc.desc   test_restoreMainWindow_1300019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_1300019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_restoreMainWindow_1300019';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };

      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        try{
          floatingBallController.restoreMainWindow({} as Want).then(() => {
            console.info(CaseName+  ' Succeeded in restoring floating ball main window.');
            expect(false).assertTrue();
            done();
          }).catch((err: Error):void => {
            console.error(CaseName+` Failed to restore floating ball main window. Cause code: ${err.code}, message: ${err.message}`);
            floatingBallController.stopFloatingBall();
            expect(err.code).assertEqual(1300019);
            expect(err.message!=null).assertTrue();
            done();
          });
        } catch (error) {
          let exception: BusinessError = error as BusinessError;
          console.error( CaseName+  `Failed restoreMainWindow. Cause:${exception.code}, message:${exception.message}`);
          expect(false).assertTrue();
          done();

        }

      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }
        else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_restoreMainWindow_1300025
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5400
     * @tc.desc   test_restoreMainWindow_1300025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_1300025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_restoreMainWindow_1300025';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let want: Want = {
        bundleName: 'com.example.actswindowtest.static',
        abilityName: 'EntryAbility'
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        floatingBallController.restoreMainWindow(want).then(() => {
          console.info(CaseName+  ' Succeeded in restoring floating ball main window.');
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+` Failed to restore floating ball main window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300025);
          expect(err.message!=null).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }
        else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   test_restoreMainWindow_load_not_exist_ability
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5500
     * @tc.desc   test_restoreMainWindow_load_not_exist_ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_load_not_exist_ability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_restoreMainWindow_load_not_exist_ability';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let want: Want = {
        bundleName: 'xxx.xxx.xxx',
        abilityName: 'TestAbility'
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        //点击闪控球
        let button: Component | null = await driver.findComponent(ON.id('FloatingBallSimpleTemplate'));
        console.info(CaseName+ ' button: ' + button);
        let Bounds: Rect = await  button!.getBounds();
        console.info(CaseName+ ' Bounds: ' + JSON.stringify(Bounds));
        await driver.click(Bounds.left,Bounds.top);
        await Utils.msSleep(200);

        floatingBallController.restoreMainWindow(want).then(() => {
          console.info(CaseName+  ' Succeeded in restoring floating ball main window.');
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+` Failed to restore floating ball main window. Cause code: ${err.code}, message: ${err.message}`);
          floatingBallController.stopFloatingBall();
          expect(err.code).assertEqual(1300026);
          expect(err.message!=null).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }
        else{
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   test_restoreMainWindow_not_click
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5600
     * @tc.desc   test_restoreMainWindow_not_click
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_not_click', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_restoreMainWindow_not_click';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let want: Want = {
        bundleName: 'com.example.actswindowtest.static',
        abilityName: 'EntryAbility'
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      let floatingBallController:floatingBall.FloatingBallController;
      try {
        floatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        floatingBallController.restoreMainWindow(want).then(() => {
          console.info(CaseName+  ' Succeeded in restoring floating ball main window.');
          expect(false).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+` Failed to restore floating ball main window. Cause code: ${err.code}, message: ${err.message}`);
          floatingBallController.stopFloatingBall();
          expect(err.code).assertEqual(1300026);
          expect(err.message!=null).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }
        else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   testCaptureWithBlacklistFloatBall
     * @tc.number SUB_BASIC_WMS_FUNCTION_CAPTURE_FILTER_0100
     * @tc.desc   截屏过滤窗口为闪控球
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCaptureWithBlacklistFloatBall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      let caseName: string = 'testCaptureWithBlacklistFloatBall';
      let floatingBallController: floatingBall.FloatingBallController;
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      let State:floatingBall.FloatingBallState;
      try {
        floatingBall.create(config).then((data: floatingBall.FloatingBallController) => {
          floatingBallController = data;
          console.info(caseName+ ` Succeeded in creating floating ball controller. Data: ${data}`);
          let onStateChange = (state: floatingBall.FloatingBallState) => {
            console.info(caseName+ ' Floating ball stateChange: ' + state);
            State = state;
          };
          floatingBallController.onStateChange(onStateChange);
          floatingBallController.startFloatingBall(startParams);
          await Utils.msSleep(1000);
          if(State == floatingBall.FloatingBallState.STARTED){
            floatingBallController.getFloatingBallWindowInfo().then((data: floatingBall.FloatingBallWindowInfo) => {
              console.info(caseName+' Succeeded in getting floating ball window info. Info: ' + JSON.stringify(data));
              let captureOption: screenshot.CaptureOption = {
                displayId: display.getDefaultDisplaySync().id,
                blackWindowIds:[data.windowId]
              };
              // let promise = screenshot.capture(captureOption);
              // promise.then((pixelMap: image.PixelMap) => {
              //   console.info(caseName+' Succeeded in saving screenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
              //   expect(pixelMap.getPixelBytesNumber()).assertLarger(0);
              //   pixelMap.release(); // PixelMap使用完后及时释放内存
              floatingBallController.offStateChange();
              floatingBallController.stopFloatingBall();
              done();
              // }).catch((err: Error):void => {
              //   console.error(caseName+` Failed to save screenshot. Code: ${err.code}, message: ${err.message}`);
              //   floatingBallController.stopFloatingBall();
              //   expect(false).assertTrue();
              //   done();
              // });
            }).catch((err: Error):void => {
              console.error(caseName + ` Failed to get floating ball window info. Cause code: ${err.code}, message: ${err.message}`);
              floatingBallController.stopFloatingBall();
              expect(false).assertTrue();
              done();
            });
          }else{
            await Utils.msSleep(300);
          }
        }).catch((err: Error):void => {
          console.error(caseName+ ` Failed to create floating ball controller. Cause:${err.code}, message:${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( caseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_restoreMainWindow_ability
     * @tc.number SUB_BASIC_WMS_FLOATING_BALL_5700
     * @tc.desc   test_restoreMainWindow_ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_restoreMainWindow_ability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let CaseName:string = 'test_restoreMainWindow_ability';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let want: Want = {
        bundleName: 'com.example.actswindowtest.static',
        abilityName: 'StartAbility'
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.SIMPLE,
        title: 'title',
      };
      try {
        let floatingBallController: floatingBall.FloatingBallController = await floatingBall.create(config);
        await floatingBallController.startFloatingBall(startParams);
        //点击闪控球
        let button: Component | null = await driver.findComponent(ON.id('FloatingBallSimpleTemplate'));
        console.info(CaseName+ ' button: ' + button);
        if (button == null) {
          console.error(CaseName+ ' button is null');
          expect(false).assertTrue();
          done();
          return;
        }
        let Bounds: Rect = await  button.getBounds();
        console.info(CaseName+ ' Bounds: ' + JSON.stringify(Bounds));
        await driver.click(Bounds.left,Bounds.top);
        await Utils.msSleep(200);

        floatingBallController.restoreMainWindow(want).then(() => {
          console.info(CaseName+  ' Succeeded in restoring floating ball main window.');
          floatingBallController.stopFloatingBall();
          expect(true).assertTrue();
          done();
        }).catch((err: Error):void => {
          console.error(CaseName+` Failed to restore floating ball main window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.message!=null).assertTrue();
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        let exception: BusinessError = error as BusinessError;
        console.error( CaseName+  `Failed. Cause:${exception.code}, message:${exception.message}`);
        expect(exception.message!=null).assertTrue();
        if(exception.code == 801){
          done();
        }
        else{
          expect(false).assertTrue();
          done();
        }
      }
    })




  })
}

