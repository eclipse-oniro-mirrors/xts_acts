/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import { AppStorage,LocalStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import screenshot from '@ohos.screenshot';
import { image } from '@kit.ImageKit';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import abilityContext from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import type { AsyncCallback, Callback} from '@ohos.base'
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import deviceInfo from '@ohos.deviceInfo';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


function isPositiveInteger(value:int) {
  //判断是否为正整数
  return Number.isInteger(value) && value > 0;
}
async function getPermision(): Promise<void> {
    let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let context : common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    let permissions: Array<Permissions> =
        ["ohos.permission.CUSTOM_SCREEN_CAPTURE"];
    try {
        atManager.requestPermissionsFromUser(context, permissions,(err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
            hilog.info(domain, tag, 'requestPermission StdProcess.tid():' + StdProcess.tid());
        });
    } catch (err) {
        console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
    }
}

async function clickButtonDriver(){
    console.error(`come in permissionClick`);
    let driver: Driver = Driver.create();
    console.error(`come in Driver create`);
    let buttonOne = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 10000);
    console.error(`buttonOne is ${JSON.stringify(buttonOne)}`);
    if(buttonOne!=null){
        buttonOne.click();
    }

}
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
  
    let want: Want = {
      bundleName: "com.example.actswindowtest.static",
      abilityName: 'StartAbility'
    };
    if (options) {
      context.startAbility(want, options).then(() => {
        hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
      }).catch((err: Error):PromiseLike<void>|undefined => {
        hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
      });
    } else {
      context.startAbility(want).then(() => {
        hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
      }).catch((err: Error):PromiseLike<void>|undefined => {
        hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
      });
    }
    await Utils.msSleep(1000)
    let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
    return windowStageStart;
  
}

async function terminateAbility(caseName: string) {
  let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
  try {
    if (pageContext !== null && pageContext !== undefined) {
      hilog.info(domain, tag,`${caseName} terminateSelf begin`);
    }
    pageContext.terminateSelf().then(() => {
      hilog.info(domain, tag,`${caseName} terminateSelf success`);
    }).catch((err: Error):PromiseLike<void>|undefined => {
      hilog.error(domain, tag,`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
    });
  } catch (e) {
    hilog.error(domain, tag,`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
  }
  await Utils.msSleep(1000)
}
export default function DisplayTest() {

    describe("DisplayTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        hilog.info(domain, tag, 'DisplayTest start');
        let abilityDelegator : abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let windowStage: window.WindowStage | undefined;
        let win: window.Window;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        let deviceType: string = deviceInfo.deviceType;
        let displayClass = display.getDefaultDisplaySync();
        let foldStatus:string= '';
        let foldDisplayMode:string= '';
        let rotation:string[];
        let orientation:string[];
        let code:number = 0;
        let displayFoldStatus:display.FoldStatus;
        let context: common.UIAbilityContext | undefined;
        let isSupportRotate = false;
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, 'beforeAll start');
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswindowtest.static")
            hilog.info(domain, tag, 'beforeAll AbilityDelegator');
            await Utils.msSleep(2000);
            displayFoldStatus = display.getFoldStatus();
            hilog.info(domain, tag, 'jsUnittest beforeAll getFoldStatus =' + displayFoldStatus);
            windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
            hilog.info(domain, tag, 'jsUnittest beforeAll windowStage =' + windowStage);
            win = AppStorage.get<window.Window>('mainWindow') as window.Window;
            hilog.info(domain, tag, 'jsUnittest beforeAll win =' + win);
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            hilog.info(domain, tag, 'jsUnittest beforeAll context =' + context);
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
            await Utils.msSleep(300);
            let Orientation1 = display.getDefaultDisplaySync().orientation;
            await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
            await Utils.msSleep(300);
            let Orientation2 = display.getDefaultDisplaySync().orientation;
            if (Orientation1 != Orientation2) {
                isSupportRotate = true;
            } else {
                isSupportRotate = false;
            }
            await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
            await Utils.msSleep(300);
            try{
                let data:string = displayClass.getDisplayCapability();
                // let capabilityData = JSON.parse(data);
                // hilog.info(domain, tag, 'jsUnittest beforeAll deviceMessage =' + JSON.stringify(capabilityData));
                // for(const capability of capabilityData!.capability){
                //     if(Number(capability.foldStatus) == displayFoldStatus){
                //         foldStatus = capability.foldStatus;
                //         foldDisplayMode = capability.foldDisplayMode;
                //         rotation = capability.rotation;
                //         orientation = capability.orientation;
                //         hilog.info(domain, tag, 'jsUnittest beforeAll foldStatus =' + capability.foldStatus);
                //         hilog.info(domain, tag, 'jsUnittest beforeAll foldDisplayMode =' + capability.foldDisplayMode);
                //         hilog.info(domain, tag, 'jsUnittest beforeAll rotation =' + capability.rotation);
                //         hilog.info(domain, tag, 'jsUnittest beforeAll orientation =' + capability.orientation);
                //     }
                // }
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, 'jsUnittest beforeAll getDisplayCapability failed ' + err.code);
                hilog.info(domain, tag, 'jsUnittest beforeAll code =' + code);
                if(err.code == 801){
                    code = 801;
                    hilog.info(domain, tag, 'jsUnittest beforeAll code =' + code);
                }else {
                    hilog.info(domain, tag, 'jsUnittest getDisplayCapability failed');
                }
            }
            await getPermision();
            hilog.info(domain, tag, 'jsUnittest clickButtonDriver before');
            await Utils.msSleep(500);
            await clickButtonDriver();
            hilog.info(domain, tag, 'jsUnittest clickButtonDriver after');

        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0450
         * @tc.name        tesGetAllDisplays_Promise_static_0100
         * @tc.desc        Gets all current display objects
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level0
         */
        it('tesGetAllDisplays_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = 'tesGetAllDisplays_Promise_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
             display.getAllDisplays().then((data:Array<display.Display>) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in obtaining all the display objects. Data.length: ' + data.length);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].id: ' + data[0].id);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].refreshRate: ' + data[0].refreshRate);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].width: ' + data[0].width);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].height: ' + data[0].height);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].rotation: ' + data[0].rotation);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].orientation: ' + data[0].orientation);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].densityDPI: ' + data[0].densityDPI);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].name: ' + data[0].name);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].alive: ' + data[0].alive);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].state: ' + data[0].state);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].densityPixels: ' + data[0].densityPixels);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].scaledDensity: ' + data[0].scaledDensity);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].xDPI: ' + data[0].xDPI);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded data[0].yDPI: ' + data[0].yDPI);
                expect(data[0].id != null).assertTrue();
                expect(data[0].refreshRate != null).assertTrue();
                expect(data[0].width != null).assertTrue();
                expect(data[0].height != null).assertTrue();
                expect(data[0].rotation != null).assertTrue();
                expect(data![0].orientation != null).assertTrue();
                expect(data[0].densityDPI != null).assertTrue();
                expect(data[0].name != null).assertTrue();
                expect(data[0].alive).assertTrue();
                expect(data[0].state != null).assertTrue();
                expect(data[0].densityPixels != null).assertTrue();
                expect(data[0].scaledDensity != null).assertTrue();
                expect(data[0].xDPI != null).assertTrue();
                expect(data[0].yDPI != null).assertTrue();
                done();
            }).catch((err:Error) :PromiseLike<void>|undefined => {
                 hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
        });
        
        /**
    * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0340
    * @tc.name        testGetDefaultDisplaySync_SyncFunction_static_0200
    * @tc.desc        To test the sync function of obtaining the target display by id
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 1
    */
    it('testGetDefaultDisplaySync_SyncFunction_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        hilog.info(0x0000, '[ANI]','testGetDefaultDisplaySync_SyncFunction_static_0200 begin');
        try {
            let dsp:display.Display = display.getDefaultDisplaySync();
            hilog.info(0x0000, '[ANI]','displayTest getDefaultDisplaySyncTest1: ' + JSON.stringify(dsp));
            expect(dsp.id).assertEqual(0);
            expect(dsp.refreshRate !== null).assertTrue();
            expect(dsp.width !== null).assertTrue();
            expect(dsp.height !== null).assertTrue();
            expect(dsp.rotation !== null).assertTrue();
            expect(dsp.densityDPI !== null).assertTrue();
            expect(dsp.name !== null).assertTrue();
            expect(dsp.alive).assertTrue();
            expect(dsp.state !== null).assertTrue();
            expect(dsp.densityPixels !== null).assertTrue();
            expect(dsp.scaledDensity !== null).assertTrue();
            expect(dsp.xDPI !== null).assertTrue();
            expect(dsp.yDPI !== null).assertTrue();
            done();
        } catch (err) {
            hilog.error(0x0000, '[ANI]','getDefaultDisplaySyncTest1 error ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
    * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5180
    * @tc.name      testCaptureStatusChange_VirtualScreenCreateDestroy_static_0100
    * @tc.desc      testCaptureStatusChange returns true when create virtual screen and false when destroy virtual screen
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level3
    */
    it('testCaptureStatusChange_VirtualScreenCreateDestroy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName : string = 'testCaptureStatusChange_VirtualScreenCreateDestroy_static_0100';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin');
        
        let captureStatus: boolean = false;
        let callbackTriggered:boolean = false;
        let callback : Callback<boolean> = (status: boolean) => {
            hilog.info(0x0000, '[ANI]', msgStr + 'capture status: ' + status);
            captureStatus = status;
            callbackTriggered = true;
        };
        
        let option: display.VirtualScreenConfig = {
            name: 'screen01',
            width: 100,
            height: 2340,
            density: 2,
            surfaceId: ''
        };
        
        try {        
            // 创建虚拟屏
            let vid = await display.createVirtualScreen(option);
            hilog.info(0x0000, '[ANI]', msgStr + 'Success in createVirtualScreen, screendId : ' + vid);
            await Utils.msSleep(3000);
            
            // 注册监听
            display.onCaptureStatusChange(callback);
            hilog.info(0x0000, '[ANI]', msgStr + 'register onCaptureStatusChange success');
            await Utils.msSleep(1000);

            // 销毁虚拟屏
            await display.destroyVirtualScreen(vid);
            hilog.info(0x0000, '[ANI]', msgStr + 'Success in destroyVirtualScreen');
            
            // 验证销毁虚拟屏后返回false
            await Utils.msSleep(3000);
            while (!callbackTriggered) {
                await Utils.msSleep(100);
            }
            hilog.info(0x0000, '[ANI]', msgStr + 'after destroyVirtualScreen, captureStatus: ' + captureStatus);
            expect(captureStatus === false).assertTrue();
            
            // 注销监听（传入callback参数）
            display.offCaptureStatusChange(callback);
            hilog.info(0x0000, '[ANI]', msgStr + 'offCaptureStatusChange success');
            
            done();
        }
        catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, caseName + 'error in createVirtualScreen or destroyVirtualScreen, err : ' + JSON.stringify(err));
            if (err.code === 801) {
                hilog.info(domain, tag, caseName + 'device not support createVirtualScreen');
            }
            expect(err.code === 801).assertTrue();
            done();
        }
    });

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0440
         * @tc.name        tesGetAllDisplays_Callback_static_0100
         * @tc.desc        Gets all current display objects
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('tesGetAllDisplays_Callback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'tesGetAllDisplays_Callback_static_0100';
            let msgStr:string  = 'jsunittest ' + caseName + ' ';
            let diaplays:Array<display.Display> | undefined;
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            display.getAllDisplays((err: BusinessError<void> | null, data: Array<display.Display> | undefined): void => {
                if (err && err.code) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (error) {
                        hilog.info(0x0000, '[ANI]',`display.getAllDisplays catch error: ${JSON.stringify(error)}`);
                    }
                    done();
                    return;
                }
                diaplays = data;
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
                expect(data![0].refreshRate != null).assertTrue();
                expect(data![0].width != null).assertTrue();
                expect(data![0].height != null).assertTrue();
                expect(data![0].rotation != null).assertTrue();
                expect(data![0].orientation != null).assertTrue();
                expect(data![0].densityDPI != null).assertTrue();
                expect(data![0].name != null).assertTrue();
                expect(data![0].alive).assertTrue();
                expect(data![0].state != null).assertTrue();
                expect(data![0].densityPixels != null).assertTrue();
                expect(data![0].scaledDensity != null).assertTrue();
                expect(data![0].xDPI != null).assertTrue();
                expect(data![0].yDPI != null).assertTrue();
                expect((data![0].screenShape === display.ScreenShape.RECTANGLE) || (data![0].screenShape === display.ScreenShape.ROUND)).assertTrue();
                done();

            });
        });

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4230
         * @tc.name        testDisplayOffFoldStatusChange_RepeatOff_static_0100
         * @tc.desc        Enable the monitoring of the folding status change of the folding device
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDisplayOffFoldStatusChange_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>  {
            let caseName:string = 'testDisplayOffFoldStatusChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.onFoldStatusChange(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldStatusChange(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldStatusChange();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4240
         * @tc.name        testDisplayOffFoldStatusChange_UnregisteredOff_static_0100
         * @tc.desc        Enable the monitoring of the folding status change of the folding device
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDisplayOffFoldStatusChange_UnregisteredOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffFoldStatusChange_UnregisteredOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                display.offFoldStatusChange();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4250
         * @tc.name        testDisplayOffFoldDisplayModeChange_RepeatOff_static_0100
         * @tc.desc        Turn off monitoring for screen display mode changes on folding devices
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDisplayOffFoldDisplayModeChange_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffFoldDisplayModeChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<display.FoldDisplayMode> = (data: display.FoldDisplayMode) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.onFoldDisplayModeChange(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldDisplayModeChange(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldDisplayModeChange();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1160
         * @tc.name        testGetCurrentFoldCreaseRegion_Test_static_0100
         * @tc.desc        TTo test the function of getCurrentFoldCreaseRegion
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 1
         */
        it('testGetCurrentFoldCreaseRegion_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

            let tag:string = 'testGetCurrentFoldCreaseRegion_Test_static_0100 '

            hilog.info(0x0000, '[ANI]',tag + ' begin');
            try {
                let region:display.FoldCreaseRegion = display.getCurrentFoldCreaseRegion();
                hilog.info(0x0000, '[ANI]',tag + "region : " + JSON.stringify(region))
                if (region != null) {
                    expect(region.displayId).assertEqual(0)
                    expect(region.creaseRects != null).assertTrue()
                    for (let i = 0; i < region.creaseRects.length; i++) {
                            expect(region.creaseRects[i].left).assertLargerOrEqual(0);
                            expect(region.creaseRects[i].top).assertLargerOrEqual(0);
                            expect(region.creaseRects[i].width).assertLargerOrEqual(0);
                            expect(region.creaseRects[i].height).assertLargerOrEqual(0);
                        }
                    done()
                } else {
                    expect(region === null).assertTrue()
                    done();
                }
            } catch (err) {
                hilog.error(0x0000, '[ANI]',tag + 'getCurrentFoldCreaseRegion failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_GET_CUTOUT_INFO_0100
         * @tc.name     test_GetCutoutInfo_static_0100
         * @tc.desc     test_GetCutoutInfo
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level 1
         */
        it('test_GetCutoutInfo_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName:string = 'test_GetCutoutInfo_static_0100';
            hilog.info(0x0000, '[ANI]',`jsunittets ${caseName} begin`);
            try {
                let displayClass: display.Display | null = null;
                displayClass = display.getDefaultDisplaySync();
                let info:display.CutoutInfo = await displayClass.getCutoutInfo();
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.boundingRects: ${info.boundingRects}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.left: ${info.waterfallDisplayAreaRects.left}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.top: ${info.waterfallDisplayAreaRects.top}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.right: ${info.waterfallDisplayAreaRects.right}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.bottom: ${info.waterfallDisplayAreaRects.bottom}`);
                done();
            } catch (error) {
                hilog.error(0x0000, '[ANI]',`jsunittets ${caseName} fail to get display available info :` + error);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0490
         * @tc.name        testGetCutoutInfo_Callbcak_static_0100
         * @tc.desc        Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testGetCutoutInfo_Callbcak_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetCutoutInfo_Callbcak_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin' );
            let dpClass: display.Display = display.getDefaultDisplaySync();
            expect(!!dpClass).assertTrue();
            dpClass.getCutoutInfo((err:BusinessError<void> | null, data:display.CutoutInfo| undefined) : void => {
                if (data!.boundingRects.length !== 0) {
                    expect(data!.boundingRects[0]!.left).assertLargerOrEqual(0);
                    expect(data!.boundingRects[0]!.top).assertLargerOrEqual(0);
                    expect(data!.boundingRects[0]!.height).assertLargerOrEqual(0);
                    expect(data!.boundingRects[0]!.width).assertLargerOrEqual(0);
                } else {
                    expect(data!.boundingRects.length).assertEqual(0);
                }
                expect(data!.waterfallDisplayAreaRects.left.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.left.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.left.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.left.height).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.height).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.height).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.height).assertLargerOrEqual(0);
                done();
                if (err && err.code) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'failed in getting cutoutInfo. cause: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
                    done();
                }
            })
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
         * @tc.name        testGetCutoutInfo_Promise_static_0100
         * @tc.desc        Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level0
         */
        it('testGetCutoutInfo_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetCutoutInfo_Promise_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin ' );
            let dpClass = display.getDefaultDisplaySync();
            expect(!!dpClass).assertTrue();
            dpClass.getCutoutInfo().then((data: display.CutoutInfo) => {
                hilog.info(0x0000, '[ANI]','Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
                if (data!.boundingRects.length !== 0) {
                    expect(data!.boundingRects[0]!.left).assertLargerOrEqual(0);
                    expect(data!.boundingRects[0]!.top).assertLargerOrEqual(0);
                    expect(data!.boundingRects[0]!.height).assertLargerOrEqual(0);
                    expect(data!.boundingRects[0]!.width).assertLargerOrEqual(0);
                } else {
                    expect(data!.boundingRects.length).assertEqual(0);
                }
                expect(data!.waterfallDisplayAreaRects.left.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.left).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.left.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.top).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.left.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.width).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.left.height).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.top.height).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.right.height).assertLargerOrEqual(0);
                expect(data!.waterfallDisplayAreaRects.bottom.height).assertLargerOrEqual(0);
                done();
            }).catch((error: Error) =>{
                hilog.error(0x0000, '[ANI]',msgStr + 'failed in getting cutoutInfo. cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done()
            });
        })
        

        /**
         * @tc.number      SUB_BASIC_WMS_FOLDSTATUS_0100
         * @tc.name        test_FoldStatus_enum_static_0100
         * @tc.desc        test_FoldStatus_enum
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('test_FoldStatus_enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_FoldStatus_enum_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            expect(display.FoldStatus.FOLD_STATUS_UNKNOWN).assertEqual(0);
            expect(display.FoldStatus.FOLD_STATUS_EXPANDED).assertEqual(1);
            expect(display.FoldStatus. FOLD_STATUS_FOLDED).assertEqual(2);
            expect(display.FoldStatus.FOLD_STATUS_HALF_FOLDED).assertEqual(3);
            expect(display.FoldStatus.FOLD_STATUS_EXPANDED_WITH_SECOND_EXPANDED).assertEqual(11);
            expect(display.FoldStatus.FOLD_STATUS_EXPANDED_WITH_SECOND_HALF_FOLDED).assertEqual(21);
            expect(display.FoldStatus. FOLD_STATUS_FOLDED_WITH_SECOND_EXPANDED).assertEqual(12);
            expect(display.FoldStatus.FOLD_STATUS_FOLDED_WITH_SECOND_HALF_FOLDED).assertEqual(22);
            expect(display.FoldStatus. FOLD_STATUS_HALF_FOLDED_WITH_SECOND_EXPANDED).assertEqual(13);
            expect(display.FoldStatus.FOLD_STATUS_HALF_FOLDED_WITH_SECOND_HALF_FOLDED).assertEqual(23);
            done();

        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1150
         * @tc.name        testGetFoldDisplayMode_Test_static_0100
         * @tc.desc        To test the function of getFoldDisplayMode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testGetFoldDisplayMode_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

            let tag:string = 'testGetFoldDisplayMode_Test_static_0100 '

            hilog.info(0x0000, '[ANI]',tag + ' begin');
            try {
                display.getFoldDisplayMode();
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_UNKNOWN).assertEqual(0);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_FULL).assertEqual(1);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_MAIN).assertEqual(2);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_SUB).assertEqual(3);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_COORDINATION).assertEqual(4);
                done();
            } catch (err) {
                hilog.error(0x0000, '[ANI]',tag + 'getFoldDisplayMode failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0240
         * @tc.name        testGetDisplayByIdSync_SyncFunction_static_0100
         * @tc.desc        To test the sync function of obtaining the target display by id
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 1
         */
        it('testGetDisplayByIdSync_SyncFunction_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(0x0000, '[ANI]','testGetDisplayByIdSync_SyncFunction_static_0100 begin');
            try {
                let displayId:long = display.getDefaultDisplaySync().id;
                let dsp:display.Display = display.getDisplayByIdSync(displayId);
                hilog.info(0x0000, '[ANI]','displayTest getDisplayByIdSyncTest1: ' + JSON.stringify(dsp));
                expect(dsp.id).assertEqual(0);
                expect(dsp.refreshRate != null).assertTrue();
                expect(dsp.width != null).assertTrue();
                expect(dsp.height != null).assertTrue();
                expect(dsp.rotation != null).assertTrue();
                expect(dsp.densityDPI != null).assertTrue();
                expect(dsp.name != null).assertTrue();
                expect(dsp.alive).assertTrue();
                expect(dsp.state != null).assertTrue();
                expect(dsp.densityPixels != null).assertTrue();
                expect(dsp.scaledDensity !=null).assertTrue();
                expect(dsp.xDPI != null).assertTrue();
                expect(dsp.yDPI != null).assertTrue();
                done();
            } catch (err) {
                hilog.error(0x0000, '[ANI]','getDisplayByIdSyncTest1 error ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5170
         * @tc.name      testGetAllDisplayPhysicalResolution_static_0100
         * @tc.desc      get all display physical resolution
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testGetAllDisplayPhysicalResolution_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetAllDisplayPhysicalResolution_static_0100';
            display.getAllDisplayPhysicalResolution().then((resolutionObjects:Array<display.DisplayPhysicalResolution>):PromiseLike<void>=> {
                hilog.info(0x0000, '[ANI]',`${caseName} Obtaining physical resolution length: ${resolutionObjects.length}`);
                for (let i = 0; i < resolutionObjects.length; i++) {
                    let resolutionObject:display.DisplayPhysicalResolution = resolutionObjects[i];
                    hilog.info(0x0000, '[ANI]',`${caseName}: ${i} foldDisplayMode: ${resolutionObject.foldDisplayMode}, physicalWidth: ${resolutionObject.physicalWidth}, physicalHeight: ${resolutionObject.physicalHeight}`)
                    expect(resolutionObject !== null).assertTrue();
                    expect(resolutionObject.physicalWidth).assertLarger(0);
                    expect(resolutionObject.physicalHeight).assertLarger(0);
                    done();
                }
            }).catch((err: Error):PromiseLike<void>|undefined => {
                if (err.code == 801) {
                    hilog.error(0x0000, '[ANI]',`${caseName}: The current device type does not support to setWindowSystemBarEnable`);
                    done();
                } else {
                    hilog.error(0x0000, '[ANI]',`${caseName}: Failed to obtain physical resolution. Code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4170
         * @tc.name        testDisplayOffAdd_RepeatOff_static_0100
         * @tc.desc        Turn off the monitor that shows device changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDisplayOffAdd_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffAdd_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<long> = (data: long) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.onAdd(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();

            }
            try {
                display.offAdd();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offAdd();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4210
         * @tc.name        testDisplayOffChange_RepeatOff_static_0100
         * @tc.desc        Turn off the monitor that shows device changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDisplayOffChange_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = 'testDisplayOffChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<long> = (data: long) => {
                console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.onChange(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offChange();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offChange();
                done();

            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4190
         * @tc.name        testDisplayOffRemove_RepeatOff_static_0100
         * @tc.desc        Turn off the monitor that shows device changes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testDisplayOffRemove_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffRemove_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<long> = (data: long) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.onRemove(callback);
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offRemove();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offRemove();
                done();
            } catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1130
         * @tc.name        testIsFoldable_Test_static_0100
         * @tc.desc        To test the function of isFoldable
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testIsFoldable_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>{

            let tag:string = 'isFoldable_Test_001_static_0100 '
            try {
                display.isFoldable();
                done();
            } catch (err) {
                hilog.info(0x0000, '[ANI]',tag + 'get isFoldable failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1140
         * @tc.name        testGetFoldStatus_Test_static_0100
         * @tc.desc        To test the function of getFoldStatus
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testGetFoldStatus_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

            let tag:string = 'getFoldStatus_Test_001_static_0100 '

            hilog.info(0x0000, '[ANI]',tag + ' begin');
            try {
                let foldStatus:number =  display.getFoldStatus();
                expect(foldStatus).assertLargerOrEqual(0);
                done();
            } catch (err) {
                hilog.error(0x0000, '[ANI]',tag + 'getFoldStatus failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5100
         * @tc.name      testFoldAngleChange_On_Off_static_0100
         * @tc.desc      register and unregister fold angle changes
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testFoldAngleChange_On_Off_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testFoldAngleChange_On_Off_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<Array<number>> = (angles: Array<number>) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. angles length: ' + angles.length);
                let angleLen = angles.length;
                for (let i = 0; i < angleLen; i++) {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. angles[' + i + ']=' + angles[i]);
                }
            };
            try {
                display.onFoldAngleChange(callback);
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldAngleChange();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number   SUB_BASIC_WMS_DMS_XTS_DISPLAY_JS_API_5110
         * @tc.name     testFoldAngleChange_ON_Off_Off_static_0200
         * @tc.desc     repeat unregister fold angle changes
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level 3
         */
        it('testFoldAngleChange_ON_Off_Off_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testFoldAngleChange_ON_Off_Off_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<Array<number>> = (angles: Array<number>) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. angles length: ' + angles.length);
                let angleLen = angles.length;
                for (let i = 0; i < angleLen; i++) {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. angles[' + i + ']=' + angles[i]);
                }
            };
            try {
                display.onFoldAngleChange(callback);
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldAngleChange(callback);
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offFoldAngleChange();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5120
         * @tc.name      testFoldAngleChange_Off_static_0300
         * @tc.desc      unregister of the fold angle changes without register
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
         */
        it('testFoldAngleChange_Off_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName : string = 'testFoldAngleChange_Off_static_0300';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                display.offFoldAngleChange();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5130
         * @tc.name      testCaptureStatusChange_On_Off_static_0100
         * @tc.desc      register and unregister capture status
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testCaptureStatusChange_On_Off_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testCaptureStatusChange_On_Off_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback : Callback<boolean> = (status: boolean) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'capture status: ' + status);
                done();
            };
            try {
                display.onCaptureStatusChange(callback);
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offCaptureStatusChange();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5140
         * @tc.name      testCaptureStatusChange_On_Off_Off_static_0200
         * @tc.desc      repeat unregister capture status
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testCaptureStatusChange_On_Off_Off_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testCaptureStatusChange_On_Off_Off_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<boolean> = (status: boolean) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'capture status: ' + status);
            };
            try {
                display.onCaptureStatusChange(callback);
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offCaptureStatusChange();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.offCaptureStatusChange();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5150
         * @tc.name      testCaptureStatusChange_Off_static_0300
         * @tc.desc      unregister the capture status of the device without register
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testCaptureStatusChange_Off_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testCaptureStatusChange_Off_static_0300';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                display.offCaptureStatusChange();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5160
         * @tc.name      testIsCaptured_static_0100
         * @tc.desc      check current device capture status
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testIsCaptured_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsCaptured_static_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let status:boolean = display.isCaptured();
                hilog.info(0x0000, '[ANI]',msgStr + 'status:' + status);
                expect(status).assertFalse();
                done();
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number	SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0070
         * @tc.name	    testDisplayState_Enum_Value_static_0100
         * @tc.desc		To test the enum value of WindowDisplayState.
         */
        it('testDisplayState_Enum_Value_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(0x0000, '[ANI]','test the enum value of Window DisplayState begin');
            try {
                expect(0).assertEqual(display.DisplayState.STATE_UNKNOWN);
                expect(1).assertEqual(display.DisplayState.STATE_OFF);
                expect(2).assertEqual(display.DisplayState.STATE_ON);
                expect(3).assertEqual(display.DisplayState.STATE_DOZE);
                expect(4).assertEqual(display.DisplayState.STATE_DOZE_SUSPEND);
                expect(5).assertEqual(display.DisplayState.STATE_VR);
                expect(6).assertEqual(display.DisplayState.STATE_ON_SUSPEND);
                done();
            } catch (err) {
                hilog.error(0x0000, '[ANI]','test enum value of windowDisplayState error ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ORIENTATION_JS_API_0290
         * @tc.name      testOrientation_attr_static_0100
         * @tc.desc      To test the attributes of Orientation
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 0
         */
        it('testOrientation_attr_static_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>{
            let msg:string = "testOrientation_attr_static_0100"
            try {
                expect(display.Orientation.PORTRAIT).assertEqual(0)
                expect(display.Orientation.LANDSCAPE).assertEqual(1)
                expect(display.Orientation.PORTRAIT_INVERTED).assertEqual(2)
                expect(display.Orientation.LANDSCAPE_INVERTED).assertEqual(3)
                done()
            } catch (error) {
                expect().assertFail()
                done()
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0100
         * @tc.name      test_getAvailableArea_default_static_0100
         * @tc.desc      test_getAvailableArea_default
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_getAvailableArea_default_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_getAvailableArea_default_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');

            try {
                // displayClass = display.getDefaultDisplaySync();
                let displayClass: display.Display = display.getDefaultDisplaySync();
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get getDefaultDisplaySync. data1: ' + JSON.stringify(displayClass));
                await Utils.msSleep(300);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get getDefaultDisplaySync. data2: ' + JSON.stringify(displayClass));
                let promise = displayClass.getAvailableArea();
                promise.then((data:display.Rect) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. data: ' + JSON.stringify(data));
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. data.top: ' + JSON.stringify(data.top));
                    expect(data.left).assertEqual(0);
                    expect(data.width).assertLarger(0);
                    expect(data.height).assertLarger(0);
                    if (displayClass) {
                        expect(data.width).assertEqual(displayClass?.availableWidth);
                        expect(data.height).assertEqual(displayClass?.availableHeight);
                    }
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0200
         * @tc.name      test_getAvailableArea_subWindow_static_0200
         * @tc.desc      test_getAvailableArea_subWindow
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_getAvailableArea_subWindow_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_getAvailableArea_subWindow_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let subWindow: window.Window;
            let displayClass: display.Display | null = null;
            let storage: LocalStorage = new LocalStorage();
            // storage.setOrCreate('storageSimpleProp', 121);
            try {
                let promise1 = windowStage!.createSubWindow('test_getAvailableArea_subWindow');
                promise1.then(async (data:window.Window) => {
                    if (data == null) {
                        hilog.error(0x0000, '[ANI]',msgStr + "Failed to create the subWindow. Cause: The data is empty");
                        expect(false).assertTrue();
                        done();
                    }
                    subWindow = data;
                    hilog.info(0x0000, '[ANI]',msgStr + "create the subWindow success");
                    let promise2 = subWindow.loadContent('pages/Index', storage);
                    promise2.then(async () => {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in loading the content.');
                        await subWindow.showWindow();
                        hilog.info(0x0000, '[ANI]',msgStr + ' showWindow success');
                        try {
                            displayClass = display.getDefaultDisplaySync();
                            let promise = displayClass?.getAvailableArea();
                            promise?.then((data:display.Rect) => {
                                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. data: ' + JSON.stringify(data));
                                expect(data.left).assertEqual(0);
                                expect(data.width).assertLarger(0);
                                expect(data.height).assertLarger(0);
                                if (displayClass) {
                                    expect(data.width).assertEqual(displayClass?.availableWidth);
                                    expect(data.height).assertEqual(displayClass?.availableHeight);
                                }
                                subWindow.destroyWindow();
                                done();
                            }).catch((err: Error):PromiseLike<void>|undefined => {
                                hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                                if (err.code == 801) {
                                    hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                                    subWindow.destroyWindow();
                                    done();
                                }
                                else {
                                    subWindow.destroyWindow();
                                    expect().assertFail();
                                    done();
                                }
                            });
                        }
                        catch (exception) {
                            hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                            subWindow.destroyWindow();
                            expect().assertFail();
                            done();
                        }
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(0x0000, '[ANI]',msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        subWindow.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                });
            }
            catch (err) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to the case. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0300
         * @tc.name      test_getAvailableArea_setWindowSystemBarEnable_static_0300
         * @tc.desc      test_getAvailableArea_setWindowSystemBarEnable
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_getAvailableArea_setWindowSystemBarEnable_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_getAvailableArea_setWindowSystemBarEnable_static_0300';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            try {
                let mainWindowClass:window.Window = await windowStage!.getMainWindow();
                displayClass = display.getDefaultDisplaySync();
                let promise1 = displayClass.getAvailableArea();
                promise1.then(async (data:display.Rect) => {
                    let AvailableArea:display.Rect = data;
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
                    await mainWindowClass.setWindowSystemBarEnable([]);
                    hilog.info(0x0000, '[ANI]',msgStr + ' setWindowSystemBarEnable success');
                    let promise = displayClass.getAvailableArea();
                    promise.then(async (data:display.Rect) => {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. data: ' + JSON.stringify(data));
                        expect(data.left).assertEqual(AvailableArea.left);
                        expect(data.top).assertEqual(AvailableArea.top);
                        expect(data.width).assertEqual(AvailableArea.width);
                        expect(data.height).assertEqual(AvailableArea.height);
                        await mainWindowClass.setWindowSystemBarEnable(['status', 'navigation']);
                        hilog.info(0x0000, '[ANI]',msgStr + ' setWindowSystemBarEnable success');
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                        if (err.code == 801) {
                            hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                            done();
                        }
                        else {
                            expect().assertFail();
                            done();
                        }
                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number   SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0400
         * @tc.name     test_getAvailableArea_ststus_bar_hide_static_0400
         * @tc.desc     test_getAvailableArea_ststus_bar_hide
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level 3
         */
        it('test_getAvailableArea_ststus_bar_hide_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_getAvailableArea_ststus_bar_hide_static_0400';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            try {
                let mainWindowClass:window.Window = await windowStage!.getMainWindow();
                displayClass = display.getDefaultDisplaySync();
                let promise1 = displayClass.getAvailableArea();
                promise1.then(async (data:display.Rect) => {
                    let AvailableArea:display.Rect = data;
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
                    await mainWindowClass.setWindowLayoutFullScreen(true).then(async () => {
                        hilog.info(0x0000, '[ANI]',msgStr + ' setWindowLayoutFullScreen success');
                        await Utils.msSleep(1000);
                        let displayClass1: display.Display = display.getDefaultDisplaySync();
                        let promise = displayClass1.getAvailableArea();
                        promise.then((data1:display.Rect) => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. data1: ' + JSON.stringify(data1));
                            if (AvailableArea.top == 0) {
                                mainWindowClass.setWindowLayoutFullScreen(false);
                                done();
                            }
                            else if (AvailableArea.top != 0) {
                                expect(data1.top).assertEqual(0);
                                mainWindowClass.setWindowLayoutFullScreen(false);
                                done();
                            }
                            else {
                                expect(false).assertTrue();
                                done();
                            }
                        }).catch((err: Error):PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                            if (err.code == 801) {
                                hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                                done();
                            }
                            else {
                                expect().assertFail();
                                done();
                            }
                        });
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(0x0000, '[ANI]',msgStr + `Failed to set setWindowLayoutFullScreen. Code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    })

                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0100
         * @tc.name      test_on_availableAreaChange_static_0100
         * @tc.desc      test_on_availableAreaChange
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_on_availableAreaChange_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName : string = 'test_on_availableAreaChange_static_0100';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin');
        let displayClass: display.Display;
        displayClass = display.getDefaultDisplaySync();
        let windowClass:window.Window = windowStage!.getMainWindowSync();
        let count = 0;
        try {
            displayClass.onAvailableAreaChange((data: display.Rect) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
                count++;
            });
            if (deviceType === '2in1') {
              // 调用maximize接口，设置窗口进入全屏模式。
              windowClass!.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
              // 调用setTitleAndDockHoverShown接口，隐藏标题栏和dock栏。
              let promise = windowClass!.setTitleAndDockHoverShown(false, false);
              promise.then(() => {
                console.info('Succeeded in setting the title and dock hoverShown false.');
              }).catch((err: Error) => {
                console.error(`Failed to set the title and dock hoverShown false. Cause code: ${err.code}, message: ${err.message}`);
              });
              await Utils.msSleep(3000);
              expect(count).assertLarger(0)
              //恢复
              let promise1 = windowClass!.recover();
              promise1.then(() => {
                console.info('Succeeded in recovering the window.');
              }).catch((err: Error) => {
                console.error(`Failed to recover the window. Cause code: ${err.code}, message: ${err.message}`);
              });
              await Utils.msSleep(3000);
            } else if (deviceType === 'tablet') {
              await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
              await Utils.msSleep(3000);
              expect(count).assertLargerOrEqual(0)
              await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
            } else {
              expect(count).assertEqual(0)
            }
            displayClass.offAvailableAreaChange();
            done();
        }
        catch (err) {
            hilog.error(0x0000, '[ANI]',msgStr + `Failed to on availableAreaChange. Code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
                hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                done();
            }
            else {
                expect().assertFail();
                done();
            }
        }
    });

        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0200
         * @tc.name      test_on_availableAreaChange_triggers_static_0200
         * @tc.desc      test_on_availableAreaChange_triggers
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_on_availableAreaChange_triggers_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_on_availableAreaChange_triggers_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            try {
                let mainWindowClass:window.Window = await windowStage!.getMainWindow();
                displayClass = display.getDefaultDisplaySync();
                let promise1 = displayClass.getAvailableArea();
                promise1.then(async (data:display.Rect) => {
                    let AvailableArea:display.Rect = data;
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
                    if (AvailableArea.top == 0) {
                        done();
                    }
                    else if (AvailableArea.top != 0) {
                        displayClass.onAvailableAreaChange((data: display.Rect) => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
                            Utils.msSleep(500);
                            expect(data.height).assertLarger(AvailableArea.height);
                            displayClass.offAvailableAreaChange();
                            mainWindowClass.recover();
                            done();
                        });
                        await mainWindowClass.setWindowLayoutFullScreen(true);
                        hilog.info(0x0000, '[ANI]',msgStr + ' setWindowLayoutFullScreen success');
                        await Utils.msSleep(500);
                    }
                    else {
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0300
         * @tc.name      test_on_availableAreaChange_Two_callback_static_0300
         * @tc.desc      test_on_availableAreaChange_Two_callback
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_on_availableAreaChange_Two_callback_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_on_availableAreaChange_Two_callback_static_0300';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            let num :number = 0;
            let callback1: Callback<display.Rect> = (data: display.Rect) => {
                num++;
                hilog.info(0x0000, '[ANI]','Listening callback1 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
            };
            let callback2: Callback<display.Rect> = (data: display.Rect) => {
                num++;
                hilog.info(0x0000, '[ANI]','Listening callback2 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
            };
            try {
                let mainWindowClass:window.Window = await windowStage!.getMainWindow();
                displayClass = display.getDefaultDisplaySync();
                let promise1 = displayClass.getAvailableArea();
                promise1.then(async (data:display.Rect) => {
                    let AvailableArea:display.Rect = data;
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
                    if (AvailableArea.top == 0) {
                        done();
                    }
                    else if (AvailableArea.top != 0) {
                        displayClass.onAvailableAreaChange(callback1);
                        displayClass.onAvailableAreaChange(callback2);
                        await mainWindowClass.setWindowLayoutFullScreen(true);
                        hilog.info(0x0000, '[ANI]',msgStr + ' setWindowLayoutFullScreen success');
                        await Utils.msSleep(1000);
                        expect(num).assertEqual(4);
                        displayClass.offAvailableAreaChange();
                        mainWindowClass.recover();
                        done();
                    }
                    else {
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0400
         * @tc.name      test_on_availableAreaChange_off_callback1_static_0400
         * @tc.desc      test_on_availableAreaChange_off_callback1
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_on_availableAreaChange_off_callback1_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_on_availableAreaChange_off_callback1_static_0400';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            let num:number = 0;
            let callback1: Callback<display.Rect> = (data: display.Rect) => {
                num--;
                hilog.info(0x0000, '[ANI]','Listening callback1 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
            };
            let callback2: Callback<display.Rect> = (data: display.Rect) => {
                num++;
                hilog.info(0x0000, '[ANI]','Listening callback2 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
            };
            try {
                let mainWindowClass:window.Window = await windowStage!.getMainWindow();
                displayClass = display.getDefaultDisplaySync();
                let promise1 = displayClass.getAvailableArea();
                promise1.then(async (data:display.Rect) => {
                    let AvailableArea:display.Rect = data;
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
                    if (AvailableArea.top == 0) {
                        done();
                    }
                    else if (AvailableArea.top != 0) {
                        displayClass.onAvailableAreaChange(callback1);
                        displayClass.onAvailableAreaChange(callback2);
                        displayClass.offAvailableAreaChange(callback2);
                        await mainWindowClass.setWindowLayoutFullScreen(true);
                        hilog.info(0x0000, '[ANI]',msgStr + ' setWindowLayoutFullScreen success');
                        await Utils.msSleep(1000);
                        expect(num).assertEqual(2);
                        displayClass.offAvailableAreaChange();
                        mainWindowClass.recover();
                        done();
                    }
                    else {
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0500
         * @tc.name      test_on_availableAreaChange_off_callback_all_static_0500
         * @tc.desc      test_on_availableAreaChange_off_callback_all_static_0500
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_on_availableAreaChange_off_callback_all_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_on_availableAreaChange_off_callback_all_static_0500';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            let num:number = 0;
            let callback1: Callback<display.Rect> = (data: display.Rect) => {
                num++;
                hilog.info(0x0000, '[ANI]','Listening callback1 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
                expect(data.left).assertLargerOrEqual(0);
                expect(data.top).assertLargerOrEqual(0);
                expect(data.width).assertLargerOrEqual(0);
                expect(data.height).assertLargerOrEqual(0);
            };
            let callback2: Callback<display.Rect> = (data: display.Rect) => {
                num++;
                hilog.info(0x0000, '[ANI]','Listening callback2 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
            };
            try {
                let mainWindowClass:window.Window = await windowStage!.getMainWindow();
                displayClass = display.getDefaultDisplaySync();
                let promise1 = displayClass.getAvailableArea();
                promise1.then(async (data:display.Rect) => {
                    let AvailableArea:display.Rect = data;
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
                    if (AvailableArea.top == 0) {
                        done();
                    }
                    else if (AvailableArea.top != 0) {
                        displayClass.onAvailableAreaChange(callback1);
                        displayClass.onAvailableAreaChange(callback2);
                        displayClass.offAvailableAreaChange();
                        await mainWindowClass.setWindowLayoutFullScreen(true);
                        hilog.info(0x0000, '[ANI]',msgStr + ' setWindowLayoutFullScreen success');
                        await Utils.msSleep(1000);
                        expect(num).assertEqual(0);
                        mainWindowClass.recover();
                        done();
                    }
                    else {
                        expect(false).assertTrue();
                        done();
                    }
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                        done();
                    }
                    else {
                        expect().assertFail();
                        done();
                    }
                });
            }
            catch (exception) {
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number   SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0600
         * @tc.name     test_off_availableAreaChange_static_0600
         * @tc.desc     test_off_availableAreaChange
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level 2
         */
        it('test_off_availableAreaChange_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName : string = 'test_off_availableAreaChange_static_0600';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let displayClass: display.Display;
            try {
                displayClass = display.getDefaultDisplaySync();
                displayClass.offAvailableAreaChange();
                done();
            }
            catch (err) {
                err = err as BusinessError;
                hilog.error(0x0000, '[ANI]',msgStr + `Failed to obtain the default display object. Code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    hilog.info(0x0000, '[ANI]',msgStr + 'The device not support getAvailableArea');
                    done();
                }
                else {
                    expect().assertFail();
                    done();
                }
            }
        });

/**
       * @tc.number       SUB_BASIC_WMS_DMS_REFRESH_LEVEL_0100
       * @tc.name         testMainScreenSupportRefreshRate_static_0100
       * @tc.desc         验证主屏刷新率支持的档位
       * @tc.size         MediumTest
       * @tc.type         Function
       * @tc.level        Level 0
       */
      it('testMainScreenSupportRefreshRate_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> =>{
        let caseName: string = "testMainScreenSupportRefreshRate_static_0100";
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
        try {
          let result:Array<Int>|undefined = display.getDisplayByIdSync(0).supportedRefreshRates;
          hilog.info(0x0000, '[ANI]',`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
          if (result === undefined) {
            done();
          } else if(result !=null) {
            let length:number = result.length;
            hilog.info(0x0000, '[ANI]',`${caseName} dresult.length: ${length}`);
            for(let i=0;i<length-1;i++){
              hilog.info(0x0000, '[ANI]',`${caseName} i: i:${result[i]}`);
              //判断是否为正整数
              expect(isPositiveInteger(result[i])).assertTrue();

              //判断递增
              expect(result[i]).assertLess(result[i+1]);
            }
            done();
          }
        } catch (e) {
          hilog.info(0x0000, '[ANI]',`${caseName} Failed.err:${JSON.stringify(e)}`);
          expect().assertFail();
          done()
        }
      })
      /**
       * @tc.number       SUB_BASIC_WMS_ScreenShape_0100
       * @tc.name         test_ScreenShape_static_0100
       * @tc.desc         test_ScreenShape_static_0100
       * @tc.size         MediumTest
       * @tc.type         Function
       * @tc.level        Level 1
       */
      it('test_ScreenShape_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (done: () => void): Promise<void> =>{
        let caseName: string = "test_ScreenShape_static_0100";
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
        try {
          expect(display.ScreenShape.RECTANGLE).assertEqual(0)
          expect(display.ScreenShape.ROUND).assertEqual(1)
          done();
        } catch (error) {
          hilog.info(0x0000, '[ANI]',`jsunittets ${caseName} fail to test_ScreenShape, cause:` + error);
          expect().assertFail();
          done();
        }
      });
      /**
       * @tc.number      SUB_BASIC_WMS_DisplaySourceMode_0100
       * @tc.name        test_DisplaySourceMode_enum_static_0100
       * @tc.desc        test_DisplaySourceMode_enum_static_0100
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('test_DisplaySourceMode_enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> =>{
        let caseName: string = 'test_DisplaySourceMode_enum_static_0100';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin');
        expect(display.DisplaySourceMode.NONE).assertEqual(0);
        expect(display.DisplaySourceMode.MAIN).assertEqual(1);
        expect(display.DisplaySourceMode.MIRROR).assertEqual(2);
        expect(display.DisplaySourceMode.EXTEND).assertEqual(3);
        expect(display.DisplaySourceMode.ALONE).assertEqual(4);
        done();
      });

      /**
       * @tc.number      SUB_BASIC_WMS_DisplaySourceMode_0200
       * @tc.name        test_display_DisplaySourceMode_static_0100
       * @tc.desc        test_display_DisplaySourceMode_static_0100
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('test_display_DisplaySourceMode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: () => void): Promise<void> =>{
        let caseName: string = 'test_display_DisplaySourceMode_static_0100';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]',msgStr + 'begin');
        let displayClass:display.Display = display.getDefaultDisplaySync();
        let sourceMode:display.DisplaySourceMode | undefined = displayClass?.sourceMode;
        hilog.info(0x0000, '[ANI]',msgStr + 'getDefaultDisplaySync DisplaySourceMode: ' + sourceMode);
        hilog.info(0x0000, '[ANI]',msgStr + 'getDefaultDisplaySync ScreenShape: ' + displayClass!.screenShape);
        hilog.info(0x0000, '[ANI]',msgStr + 'getDefaultDisplaySync x: ' + displayClass!.x);
        hilog.info(0x0000, '[ANI]',msgStr + 'getDefaultDisplaySync y: ' + displayClass!.y);
        expect(sourceMode).assertEqual(1);
        expect(displayClass!.screenShape !=null ).assertTrue();
        expect(displayClass!.x).assertLargerOrEqual(0);
        expect(displayClass!.y).assertLargerOrEqual(0);
        
        done();
      });

      /**
         * @tc.number    SUB_BASIC_DMS_JS_0200
         * @tc.name      test_getPrimaryDisplaySync_static_0100
         * @tc.desc      test_getPrimaryDisplaySync_static_0100
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_getPrimaryDisplaySync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'test_getPrimaryDisplaySync_static_0100';
            try{
                let displayInfo:display.Display = display.getPrimaryDisplaySync();
                hilog.info(domain, tag,caseName + ' displayInfo:'+ displayInfo);
                hilog.info(domain, tag,caseName + ' displayInfo.id:'+ displayInfo.id);
                expect(displayInfo.id).assertEqual(0);
                hilog.info(domain, tag,caseName + ' displayInfo.name:'+ displayInfo.name);
                expect(displayInfo.name != null).assertTrue();
                hilog.info(domain, tag,caseName + ' displayInfo.alive:'+ displayInfo.alive);
                expect(displayInfo.alive).assertEqual(true);
                hilog.info(domain, tag,caseName + ' displayInfo.width:'+ displayInfo.width);
                expect(displayInfo.width).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.height:'+ displayInfo.height);
                expect(displayInfo.height).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.refreshRate:'+ displayInfo.refreshRate);
                expect(displayInfo.refreshRate).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.densityDPI:'+ displayInfo.densityDPI);
                expect(displayInfo.densityDPI).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.densityPixels:'+ displayInfo.densityPixels);
                expect(displayInfo.densityPixels).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.scaledDensity:'+ displayInfo.scaledDensity);
                expect(displayInfo.scaledDensity).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.xDPI:'+ displayInfo.xDPI);
                expect(displayInfo.xDPI).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.yDPI:'+ displayInfo.yDPI);
                expect(displayInfo.yDPI).assertLarger(0);
                hilog.info(domain, tag,caseName + ' displayInfo.state:'+ displayInfo.state);
                expect(displayInfo.state).assertEqual(2);
                hilog.info(domain, tag,caseName + ' displayInfo.hdrFormats:'+ displayInfo.hdrFormats);
                expect(displayInfo.hdrFormats != null).assertTrue();
                hilog.info(domain, tag,caseName + ' displayInfo.colorSpaces:'+ displayInfo.colorSpaces);
                expect(displayInfo.colorSpaces != null).assertTrue();
                hilog.info(domain, tag,caseName + ' displayInfo.rotation:'+ displayInfo.rotation);
                hilog.info(domain, tag,caseName + ' displayInfo.orientation:'+ displayInfo.orientation);
                if(code == 801){
                    expect(displayInfo.rotation).assertEqual(0);
                    expect(displayInfo.orientation).assertEqual(0);
                    done();
                }else {
                    let rotation:Int = displayInfo.rotation;
                    // expect(displayInfo.orientation).assertEqual(int(orientation[rotation]));
                    done();
                }
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + ': fail:'+ err + ' '+err.code);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0100
         * @tc.name      test_CreateVirtualScreen_ErrorCode1400001_static
         * @tc.desc      test_CreateVirtualScreen_ErrorCode1400001 when got invalid size
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_CreateVirtualScreen_ErrorCode1400001_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_CreateVirtualScreen_ErrorCode1400001_static ';
            let option: display.VirtualScreenConfig = {
                name: 'screen01',
                width: -1,
                height: 2340,
                density: 2,
                surfaceId: ''
            }
            try {
                display.createVirtualScreen(option).then((screenId: Long) => {
                    hilog.info(domain, tag,caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.info(domain, tag,caseName + 'failed to create the virtual screen, err : ' + JSON.stringify(err));
                    expect(err.code == 1400001).assertTrue();
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
                if (err.code != 801) {
                    expect(false).assertTrue();
                }
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_0100
         * @tc.name      test_CreateVirtualScreen01_static
         * @tc.desc      test_CreateVirtualScreen01 
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_CreateVirtualScreen01_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_CreateVirtualScreen01_static ';
            let option: display.VirtualScreenConfig = {
                name: 'screen01',
                width: 100,
                height: 2340,
                density: 2,
                surfaceId: ''
            }
            try {
                 display.createVirtualScreen(option).then(async (screenId: Long) => {
                    hilog.info(domain, tag,caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
                     display.destroyVirtualScreen(screenId).then(() => {
                        hilog.info(domain, tag,caseName + 'succeeded in destroyVirtualScreen');
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.info(domain, tag,caseName + 'failed to destroyVirtualScreen, err : ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    })
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
                expect(err.code == 801).assertTrue();
                done();
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_DESTROY_VIRTUALSCREEN_ERRORCODE_0100
         * @tc.name      test_DestroyVirtualScreenErrorcode401_static
         * @tc.desc      test_DestroyVirtualScreenErrorcode_401 when got invalid screendId like -1
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_DestroyVirtualScreenErrorcode401_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_DestroyVirtualScreenErrorcode401 ';
            try {
                 display.destroyVirtualScreen(-1).then(() => {
                    hilog.info(domain, tag,caseName + 'succeeded in destroy virtual screen, data : ');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(domain, tag,caseName + 'failed to destroyVirtualScreen, err : ' + JSON.stringify(err));
                     expect(err.code).assertTrue();
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
                if (err.code === 801) {
                    done();
                } else {
                    expect(err.code === 401).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_DESTROY_VIRTUALSCREEN_ERRORCODE_0200
         * @tc.name      test_DestroyVirtualScreenErrorcode401_02_static
         * @tc.desc      test_DestroyVirtualScreenErrorcode_401 when destroy a screen that has already been destroyed
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_DestroyVirtualScreenErrorcode401_02_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_DestroyVirtualScreenErrorcode401_02_static ';
            let option:display.VirtualScreenConfig = {
                name: 'screen01',
                width: 1,
                height: 2340,
                density: 2,
                surfaceId: ''
            }
            try {
                 display.createVirtualScreen(option).then(async (screenId: Long) => {
                    hilog.info(domain, tag,caseName + 'Succeeded in creating ther virtual screen. Data: ' + JSON.stringify(screenId));
                     display.destroyVirtualScreen(screenId).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeeded in destroyVirtualScreen1');
                        display.destroyVirtualScreen(screenId).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeeded in destroyVirtualScreen2');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.info(domain, tag,caseName + 'Failed in destroyVirtualScreen2');
                        expect(err.code == 401);
                        done();
                    })
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.info(domain, tag,caseName + 'Failed in destroyVirtualScreen1');
                        expect(false).assertTrue();
                        done();
                    })
                    
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(domain, tag,caseName + 'failed to createVirtualScreen, err : ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
                expect(err.code == 801);
                done();
            }
        });

        /**
         * @tc.number    SUB_BASIC_WMS_SET_VIRTUALSCREEN_SURFACE_ERRORCODE_static_0100
         * @tc.name      test_setVirtualScreenSurface_ErrorCode401_static
         * @tc.desc      test_setVirtualScreenSurface_ErrorCode401 when got a invalid screenId like -1
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_setVirtualScreenSurface_ErrorCode401_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setVirtualScreenSurface_ErrorCode401_static ';
            try {
                 display.setVirtualScreenSurface(-1, '').then(() => {
                    hilog.info(domain, tag,caseName + 'success in setVirtualScreenSurface');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                     hilog.info(domain, tag,caseName + 'failed to setVirtualScreenSurface, err : ' + JSON.stringify(err));
                     expect(false).assertTrue();
                     done();
                 })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in setVirtualScreenSurface, err : ' + JSON.stringify(err));
                if (err.code === 801) {
                    done();
                } else {
                    expect(err.code === 401).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SET_VIRTUALSCREEN_SURFACE_ERRORCODE_static_0200
         * @tc.name      test_setVirtualScreenSurface_ErrorCode401_static_02
         * @tc.desc      test_setVirtualScreenSurface_ErrorCode401 when got non existent surfaceId like ''
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('test_setVirtualScreenSurface_ErrorCode401_static_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setVirtualScreenSurface_ErrorCode401_static_02 ';
            let option: display.VirtualScreenConfig = {
                name: 'screen01',
                width: 1,
                height: 2340,
                density: 2,
                surfaceId: ''
            };
            try {
                let screenId: Long = await display.createVirtualScreen(option);
                hilog.info(domain, tag,caseName + 'success in createVirtualScreen ' + screenId);
                 display.setVirtualScreenSurface(screenId, '').then(() => {
                    hilog.info(domain, tag,caseName + 'success in setVirtualScreenSurface');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                     hilog.info(domain, tag,caseName + 'failed to setVirtualScreenSurface, err : ' + JSON.stringify(err));
                     expect(err.code == 401).assertTrue();
                     done();
                 })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in setVirtualScreenSurface, err : ' + JSON.stringify(err));
                if(err.code == 801){
                    expect(err.code == 801).assertTrue();
                    done();
                }else{
                    expect(false).assertTrue();
                    done();
                }
                
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_MAKEUNIQUE_ERRORCODE_static_0100
         * @tc.name      test_MakeUniqueErrorcode_401_static
         * @tc.desc      test_MakeUniqueErrorcode_401 when got invalid screenId like -1
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_MakeUniqueErrorcode_401_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_MakeUniqueErrorcode_401_static ';
            try {
                 display.makeUnique(-1).then(()=>{
                    hilog.info(domain, tag,caseName + 'Succeeded in makeUnique');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) :PromiseLike<void>|undefined => {
                    hilog.info(domain, tag,caseName + 'Error in makeUnique, err: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
                if (err.code === 801) {
                    done();
                } else {
                    expect(err.code === 401).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_MAKEUNIQUE_ERRORCODE_static_0200
         * @tc.name      test_MakeUniqueErrorcode_1400001_static
         * @tc.desc      test_MakeUniqueErrorcode_1400001 when makeUnique a virtual screen that has already been destroyed
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_MakeUniqueErrorcode_1400001_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_MakeUniqueErrorcode_1400001_static ';
            let option: display.VirtualScreenConfig = {
                name: 'screen01',
                width: 1,
                height: 2340,
                density: 2,
                surfaceId: ''
            }
            try {
                let vid = await display.createVirtualScreen(option);
                hilog.info(domain, tag,caseName + 'Success in createVirtualScreen, screendId : ' + vid);
                await display.destroyVirtualScreen(vid);
                hilog.info(domain, tag,caseName + 'Success in destroyVirtualScreen');

                display.makeUnique(vid).then(() => {
                    hilog.info(domain, tag,caseName + 'Success in make unique screen');
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) :PromiseLike<void>|undefined=> {
                    hilog.info(domain, tag,caseName + 'Failed to makeUnique, err: ' + JSON.stringify(err));

                    done();
                })
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
                expect(err.code == 801);
                done();
            }
        });


        /**
         * @tc.number     SUB_BASIC_DMS_JS_static_0500
         * @tc.name       test_js_capture_privateWindow_static
         * @tc.desc       test_js_capture_privateWindow_static
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('test_js_capture_privateWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'test_js_capture_privateWindow_static';
            try{
                let windowClass:window.Window = windowStage!.getMainWindowSync();
                windowClass.setWindowPrivacyMode(true, (err: BusinessError<void> | null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(domain, tag,`caseName + Failed to set the window to privacy mode. Cause code: ${err!.code}, message: ${err!.message}`);
                        return;
                    }
                    hilog.info(domain, tag,caseName + 'Succeeded in setting the window to privacy mode.');
                    let captureOption: screenshot.CaptureOption = {
                        "displayId": 0,
                        "blackWindowIds": []

                    };
                    let promise = screenshot.capture(captureOption);
                    promise.then((PixelMap: image.PixelMap) => {
                        hilog.info(domain, tag,caseName + 'Succeeded in saving screenshot. Pixel bytes number: ' + PixelMap.getPixelBytesNumber());
                        PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
                            let PixelMapWidth = imageInfo.size.width;
                            let PixelMapHeight = imageInfo.size.height;
                            hilog.info(domain, tag,caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
                            expect(PixelMapWidth).assertLarger(0);
                            expect(PixelMapHeight).assertLarger(0);
                            PixelMap.release(); // PixelMap使用完后及时释放内存
                            done();
                        })
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.info(domain, tag,caseName +'Failed to save screenshot. Code: ' + JSON.stringify(err));
                        if(err.code == 801){
                            windowClass.setWindowPrivacyMode(false);
                            done();
                        }else if(err.code == 1400003){
                            hilog.info(domain, tag,caseName + 'privateWindow not support capture');
                            done();
                        }else{
                            expect(false).assertTrue();
                            done();
                        }
                    });

                });

            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag,caseName + ': fail:'+ err + ' '+err.code);
                expect(false).assertTrue();
                done();
            }
        })

      /**
         * @tc.number      SUB_BASIC_WMS_CONVERTCOORDINATE_Static_0500
         * @tc.name        testConvertGlobalToRelativeCoordinatewithPositionOutofRange_Static
         * @tc.desc        验证convertGlobalToRelativeCoordinate接口position超出int32报1400004
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testConvertGlobalToRelativeCoordinatewithPositionOutofRange_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testConvertGlobalToRelativeCoordinatewithPositionOutofRange_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let displayClass:display.Display = display.getDefaultDisplaySync();
                hilog.info(domain, tag,`${caseName} displayClass.id: ${displayClass.id}`);
                const exceedMax = 2147483648;
                let position: display.Position = {
                    x: exceedMax,
                    y: exceedMax
                };
                display.convertGlobalToRelativeCoordinate(position, displayClass.id);
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed. err: ${JSON.stringify(e)}`);
                expect(e.code).assertEqual(1400004);
                expect(e.message!=null).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_CONVERTCOORDINATE_Static_0600
         * @tc.name        testConvertGlobalToRelativeCoordinatewithInvalidDisplayid_Static
         * @tc.desc        验证convertGlobalToRelativeCoordinate接口传入displayId<0报1400004
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testConvertGlobalToRelativeCoordinatewithInvalidDisplayid_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testConvertGlobalToRelativeCoordinatewithInvalidDisplayid_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let position: display.Position = {
                    x: 50,
                    y: 50
                };
                display.convertGlobalToRelativeCoordinate(position, -1);
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed. err: ${JSON.stringify(e)}`);
                expect(e.code).assertEqual(1400004)
                expect(e.message!=null).assertTrue();
                done()
            }
        })


        /**
         * @tc.number      SUB_BASIC_WMS_CONVERTCOORDINATE_Static_0800
         * @tc.name        testConvertGlobalToRelativeCoordinatewithDisplayid_Static
         * @tc.desc        验证convertGlobalToRelativeCoordinate接口，传入displayId，在除RK外的设备正常调用
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testConvertGlobalToRelativeCoordinatewithDisplayid_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = "testConvertGlobalToRelativeCoordinatewithDisplayid_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let result:display.Display = display.getDisplayByIdSync(0);
                hilog.info(domain, tag,`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
                let width = result.width / 2;
                let height = result.height / 2;
                hilog.info(domain, tag,`${caseName} width: ${width}`);
                hilog.info(domain, tag,`${caseName} height: ${height}`);

                let position: display.Position = {
                    x: width,
                    y: height
                };
                let relativePosition = display.convertGlobalToRelativeCoordinate(position, 0);
                hilog.info(domain, tag,`${caseName} relativePosition: ${JSON.stringify(relativePosition)}`);
                expect(Math.abs(relativePosition.position.x - width)).assertLargerOrEqual(0)
                expect(Math.abs(relativePosition.position.y - height)).assertLargerOrEqual(0)
                expect(relativePosition.displayId).assertEqual(0)
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed2. err: ${JSON.stringify(e)}`);
                if (e.code === 801) {
                    expect(e.message!=null).assertTrue();
                    done()
                } else {
                    expect(false).assertTrue();
                    done()
                }
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_CONVERTCOORDINATE_Static_0900
         * @tc.name        testConvertGlobalToRelativeCoordinatewithoutDisplayid_Static
         * @tc.desc        验证convertGlobalToRelativeCoordinate接口，不传入displayId，在除RK外的设备正常调用
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testConvertGlobalToRelativeCoordinatewithoutDisplayid_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = "testConvertGlobalToRelativeCoordinatewithoutDisplayid_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let result:display.Display = display.getDisplayByIdSync(0);
                hilog.info(domain, tag,`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
                let width = result.width / 2;
                let height = result.height / 2;
                hilog.info(domain, tag,`${caseName} width: ${width}`);
                hilog.info(domain, tag,`${caseName} height: ${height}`);

                let position: display.Position = {
                    x: width,
                    y: height
                };
                let relativePosition = display.convertGlobalToRelativeCoordinate(position);
                hilog.info(domain, tag,`${caseName} relativePosition: ${JSON.stringify(relativePosition)}`);
                expect(Math.abs(relativePosition.position.x - width)).assertLargerOrEqual(0)
                expect(Math.abs(relativePosition.position.y - height)).assertLargerOrEqual(0)
                expect(relativePosition.displayId).assertEqual(0)
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed2. err: ${JSON.stringify(e)}`);
                if (e.code === 801) {
                    expect(e.message!=null).assertTrue();
                    done()
                } else {
                    expect(false).assertTrue();
                    done()
                }
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_GET_LIVE_CREASE_REGION_Static_0100
         * @tc.name        testGetLiveCreaseRegion_Static
         * @tc.desc        验证折叠设备可查询到折痕区域，非折叠设备折痕区域返回空
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 0
         */
        it('testGetLiveCreaseRegion_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = "testGetLiveCreaseRegion_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let result:boolean = display.isFoldable();
                let isExpand:number = display.getFoldDisplayMode()
                hilog.info(domain, tag,`${caseName} isFoldable: ${result}`);
                let defaultDisplay:display.Display = display.getDefaultDisplaySync();
                hilog.info(domain, tag,`${caseName} defaultDisplay: ${JSON.stringify(defaultDisplay)}`);
                let region:display.FoldCreaseRegion = defaultDisplay.getLiveCreaseRegion();
                hilog.info(domain, tag,`${caseName} region: ${JSON.stringify(region)}`);
                expect(region.displayId).assertEqual(0)
                if (result) {
                    if (region.creaseRects.length === 0) {
                        done();
                    } else {
                        for (let i = 0; i < region.creaseRects.length; i++) {
                            expect(region.creaseRects[i].left).assertLargerOrEqual(0);
                            expect(region.creaseRects[i].top).assertLargerOrEqual(0);
                            expect(region.creaseRects[i].width).assertLargerOrEqual(0);
                            expect(region.creaseRects[i].height).assertLargerOrEqual(0);
                        }
                    }
                } else {
                    expect(region.creaseRects.length).assertEqual(0)
                }
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag,`${caseName} Failed2. err: ${JSON.stringify(e)}`);
                if (e.code === 801) {
                    expect(e.message!=null).assertTrue();
                    done()
                } else {
                    expect(false).assertTrue();
                    done()
                }
            }
        })
        /**
     * @tc.name   testConvertRelativeToGlobalCoordinatewithPositionOutofRange_static
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_static_0100
     * @tc.desc   验证convertRelativeToGlobalCoordinate接口position超出int32报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertRelativeToGlobalCoordinatewithPositionOutofRange_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName:string = "testConvertRelativeToGlobalCoordinatewithPositionOutofRange_static";
        let msgStr:string = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        try {
            let displayClass:display.Display = display.getDefaultDisplaySync();
            console.log(`${caseName} displayClass.id: ${displayClass.id}`);
            const exceedMax:Long = 2147483648;
            let position: display.Position = {
                x: exceedMax,
                y: exceedMax
            };
            let param: display.RelativePosition = {
                displayId: displayClass.id,
                position: position
            }
            display.convertRelativeToGlobalCoordinate(param);
            expect(false).assertTrue();
            done();
        } catch (e) {
            e = e as BusinessError;
            console.error(`${caseName} Failed. err: ${JSON.stringify(e)}`);
            expect(e.code).assertEqual(1400004)
            done()
        }
    })
    /**
     * @tc.number     SUB_BASIC_DMS_GET_BRIGHTNESS_INFO_static_0100
     * @tc.name       testGetBrightnessInfowithMainDisplayid_static
     * @tc.desc       查询主屏亮度信息
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testGetBrightnessInfowithMainDisplayid_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName:string =  'testGetBrightnessInfowithMainDisplayid_static';
        try {
            let brightnessInfo = display.getBrightnessInfo(0);
            console.log(`${caseName} brightnessInfo: ${JSON.stringify(brightnessInfo)}`);
            expect(brightnessInfo.sdrNits).assertLarger(0);
            expect(brightnessInfo.currentHeadroom).assertLarger(0);
            expect(brightnessInfo.maxHeadroom).assertLarger(0);
            done();
        } catch (e) {
            e = e as BusinessError;
            console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
            if (e.code == 801) {
                done()
            } else {
                expect(false).assertTrue();
                done();
            }
        }
    });
    /**
     * @tc.number     SUB_BASIC_DMS_ON_BRIGHTNESS_CHANGE_static_0100
     * @tc.name       testOnBrightnessInfoChange_static_0100
     * @tc.desc       主屏通过调节窗口亮度触发屏幕亮度信息变化，取消全部监听
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testOnBrightnessInfoChange_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName:string =  'testOnBrightnessInfoChange_static_0100';
        try {
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            console.info(`${caseName} getMainWindowSync success`);
            await windowClass.setWindowBrightness(1);
            console.info(`${caseName} setWindowBrightness 1 success`);
            await Utils.msSleep(100);
            let brightnessChangeCount1:number = 0;
            let brightnessChangeCount2:number = 0;
            let callback1Triggered:boolean = false;
            let callback2Triggered:boolean = false;

            const callback1 = (displayId: Long, brightnessInfo: display.BrightnessInfo) => {
                console.info(caseName + ' Callback1 triggered');
                console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
                brightnessChangeCount1 = brightnessChangeCount1 + 1;
                callback1Triggered = true;
                expect(displayId).assertEqual(0);
                expect(brightnessInfo.sdrNits).assertLarger(0);
                expect(brightnessInfo.currentHeadroom).assertLarger(0);
                expect(brightnessInfo.maxHeadroom).assertLarger(0);
                console.info(`${caseName} Callback1: brightnessChangeCount1 = ${brightnessChangeCount1}`);
            };

            const callback2 = (displayId: Long, brightnessInfo: display.BrightnessInfo) => {
                console.info(caseName + ' Callback2 triggered');
                console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
                brightnessChangeCount2 = brightnessChangeCount2 + 1;
                callback2Triggered = true;
                expect(displayId).assertEqual(0);
                expect(brightnessInfo.sdrNits).assertLarger(0);
                expect(brightnessInfo.currentHeadroom).assertLarger(0);
                expect(brightnessInfo.maxHeadroom).assertLarger(0);
                console.info(`${caseName} Callback2: brightnessChangeCount2 = ${brightnessChangeCount2}`);
            };
            display.onBrightnessInfoChange(callback1);
            display.onBrightnessInfoChange(callback2);
            console.info(caseName + ' Brightness change listeners registered successfully');
            await windowClass.setWindowBrightness(0);
            await Utils.msSleep(100);
            while (!callback1Triggered) {
                await Utils.msSleep(100);
            }
            console.info(`${caseName} brightnessChangeCount1 = ${brightnessChangeCount1}`);
            while (!callback2Triggered) {
                await Utils.msSleep(100);
            }
            console.info(`${caseName} brightnessChangeCount2 = ${brightnessChangeCount2}`);
            expect(brightnessChangeCount1).assertLarger(0);
            expect(brightnessChangeCount2).assertLarger(0);
            display.offBrightnessInfoChange();
            brightnessChangeCount1 = 0;
            brightnessChangeCount2 = 0;
            await windowClass.setWindowBrightness(1);
            await Utils.msSleep(3000);
            console.info(`${caseName} after off brightnessChangeCount1 = ${brightnessChangeCount1}`);
            console.info(`${caseName} after off brightnessChangeCount2 = ${brightnessChangeCount2}`);
            expect(brightnessChangeCount1).assertEqual(0);
            expect(brightnessChangeCount2).assertEqual(0);
            await windowClass.setWindowBrightness(-1);
            await Utils.msSleep(100);
            done();
        } catch (e) {
            e = e as BusinessError;
            console.error(`${caseName} Failed. Cause: ${e}`);
            if (e.code == 801) {
                done()
            } else {
                display.offBrightnessInfoChange();
                expect(false).assertTrue();
                done();
            }
        }
    });
    /**
     * @tc.number     SUB_BASIC_DMS_VIRTUAL_SCREEN_SUPPORT_FOCUS_static_0100
     * @tc.name       testCreateVirtualScreenwithSupportsFocusIsTrue_static
     * @tc.desc       testCreateVirtualScreenwithSupportsFocusIsTrue
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testCreateVirtualScreenwithSupportsFocusIsTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName:string =  'testCreateVirtualScreenwithSupportsFocusIsTrue_static';
        console.log(caseName + 'begin');
        try {
            display.createVirtualScreen({
                name: 'createVirtualScreen1',
                width: 1080,
                height: 2720,
                density: 2,
                surfaceId: '',
                supportsFocus: true
            }).then(async (displayId: Long) => {
                console.log(caseName + 'createVirtualScreen success');
                await display.makeUnique(displayId);
                await display.makeUnique(displayId).then(async () => {
                    console.log(caseName + 'succeeded in makeUnique');
                    let options: StartOptions = {
                        displayId: displayId
                    }
                    console.log(caseName + 'startAbility start.. ');
                    let windowStageStart = await startAbility(caseName, context!, options);
                    console.log(caseName + 'getMainWindowSync start.. ');
                    let windowClass:window.Window = windowStageStart.getMainWindowSync();
                    console.log(caseName + 'getMainWindowSync ssuccess: '+windowClass);
                    await windowClass.setWindowFocusable(true);
                    console.log(caseName + 'setWindowFocusable true ssuccess');
                    await terminateAbility(caseName);
                    done();
                }).catch(async (err: Error) => {
                    console.error(caseName + 'failed in makeUnique, err : ' + err+ err.code);
                    if (err.code == 801) {
                        expect(err.code).assertEqual(801)
                        done();
                    } else {
                        await terminateAbility(caseName);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }).catch(async (err: Error) => {
                console.error(caseName + 'failed in createVirtualScreen, err : ' + err+ err.code);
                if (err.code == 801) {
                    expect(err.code).assertEqual(801)
                    done();
                } else {
                    await terminateAbility(caseName);
                    expect(false).assertTrue();
                    done();
                }
            })
        } catch (e) {
            e = e as BusinessError;
            console.error(`${caseName} Failed. Cause: ${e}`);
            await terminateAbility(caseName);
            expect(false).assertTrue();
            done();
        }
    });
    /**
    * @tc.number    SUB_BASIC_WMS_GETDISPLAYBYIDSYNC_ERRORCODE_static_0100
    * @tc.name      test_GetDisplayByIdSyncErrorcode_401_static_0100
    * @tc.desc      test_GetDisplayByIdSyncErrorcode_401 when input is -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level2
    */
    it('test_GetDisplayByIdSyncErrorcode_401_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName: string = 'test_GetDisplayByIdSyncErrorcode_401_static_0100';
        try {
            display.getDisplayByIdSync(-1);
            hilog.info(domain, tag, caseName + 'Succeeded in getDisplayByIdSync with -1');
            expect(false).assertTrue();
            done();
        } catch (err) {
            err = err as BusinessError;
            hilog.info(domain, tag, caseName + 'error in getDisplayByIdSync, err : ' + JSON.stringify(err));
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.number SUB_BASIC_DMS_GET_ROUNDED_CORNER_0100
     * @tc.name   testGetRoundedCorner_static_0100
     * @tc.desc   逻辑屏getRoundedCorner接口查询屏幕圆角信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRoundedCorner_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName : string = 'testGetRoundedCorner_static_0100';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin');
        try {
            let displayInfo = display.getDefaultDisplaySync();
            console.info(caseName + ' displayInfo: ' + JSON.stringify(displayInfo));
            let roundedCorner = displayInfo.getRoundedCorner();
            console.info(caseName + ' roundedCorner: ' + JSON.stringify(roundedCorner));
            console.info(caseName + ' roundedCorner length: ' + JSON.stringify(roundedCorner.length));
            if (roundedCorner.length !== 0) {
                expect(roundedCorner.length).assertLarger(0)
                expect(roundedCorner[0].type).assertEqual(0)
                expect(roundedCorner[0].position.x).assertEqual(roundedCorner[0].radius)
                expect(roundedCorner[0].position.y).assertEqual(roundedCorner[0].radius)
                expect(roundedCorner[1].type).assertEqual(1)
                expect(roundedCorner[1].position.x).assertEqual(displayInfo.width - roundedCorner[1].radius)
                expect(roundedCorner[1].position.y).assertEqual(roundedCorner[1].radius)
                expect(roundedCorner[2].type).assertEqual(2)
                expect(roundedCorner[2].position.x).assertEqual(displayInfo.width - roundedCorner[2].radius)
                expect(roundedCorner[2].position.y).assertEqual(displayInfo.height - roundedCorner[2].radius)
                expect(roundedCorner[3].type).assertEqual(3)
                expect(roundedCorner[3].position.x).assertEqual(roundedCorner[3].radius)
                expect(roundedCorner[3].position.y).assertEqual(displayInfo.height - roundedCorner[3].radius)
                expect(display.CornerType.TOP_LEFT).assertEqual(0);
                expect(display.CornerType.TOP_RIGHT).assertEqual(1);
                expect(display.CornerType.BOTTOM_RIGHT).assertEqual(2);
                expect(display.CornerType.BOTTOM_LEFT).assertEqual(3);
                done();
            } else {
                expect(roundedCorner.length).assertEqual(0)
                done();
            }
        } catch (err) {
            console.error(0x0000, '[ANI]', msgStr + 'Failed. case ：' + JSON.stringify(err));
            if (err.code === 801) {
                done();
            } else {
                expect().assertFail()
                done();
            }
        }
    })

    /**
    * @tc.number SUB_DMS_GET_ROUNDED_CORNER_0200
    * @tc.name   testGetRoundedCornerwithVirtualDisplay_static_0100
    * @tc.desc   虚拟屏getRoundedCorner接口查询屏幕圆角信息返回空数组
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('testGetRoundedCornerwithVirtualDisplay_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetRoundedCornerwithVirtualDisplay_static_0100';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin');
        let option: display.VirtualScreenConfig = {
                name: 'screen01',
                width: 100,
                height: 2340,
                density: 2,
                surfaceId: ''
            };
        try {
            // 创建虚拟屏
            let vid = await display.createVirtualScreen(option);
            hilog.info(0x0000, '[ANI]', msgStr + 'Success in createVirtualScreen, screendId : ' + vid);
            await Utils.msSleep(500);
            let displayInfo = display.getDisplayByIdSync(vid);
            console.info(caseName + ' displayInfo: ' + JSON.stringify(displayInfo));
            await Utils.msSleep(300);
            let roundedCorner = displayInfo.getRoundedCorner();
            console.info(caseName + ' roundedCorner: ' + JSON.stringify(roundedCorner));
            console.info(caseName + ' roundedCorner length: ' + JSON.stringify(roundedCorner.length));
            expect(roundedCorner.length).assertEqual(0)
            await Utils.msSleep(300);
            await display.destroyVirtualScreen(vid);
            done()
        } catch (err) {
            console.error(0x0000, '[ANI]', msgStr + 'Failed. case ：' + JSON.stringify(err));
            if (err.code === 801) {
                done();
            } else {
                expect().assertFail()
            }
        }
    })

    /**
    * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5190
    * @tc.name      testOnAdd_VirtualScreenCreate_static_0100
    * @tc.desc      testOnAdd returns screenId when create virtual screen
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level3
    */
    it('testOnAdd_VirtualScreenCreate_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName : string = 'testOnAdd_VirtualScreenCreate_static_0100';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin');
        
        let receivedScreenId: Long = -1;
        let callbackTriggered:boolean = false;
        let callback: Callback<Long> = (screenId: Long) => {
            callbackTriggered = true
            hilog.info(0x0000, '[ANI]', msgStr + 'onAdd callback received. Data: ' + JSON.stringify(screenId));
            receivedScreenId = screenId;
        };
        
        let option: display.VirtualScreenConfig = {
            name: 'screen01',
            width: 100,
            height: 2340,
            density: 2,
            surfaceId: ''
        };
        
        try {
            // 注册监听
            display.onAdd(callback);
            hilog.info(0x0000, '[ANI]', msgStr + 'register onAdd success');
            
            // 创建虚拟屏
            let vid = await display.createVirtualScreen(option);
            hilog.info(0x0000, '[ANI]', msgStr + 'Success in createVirtualScreen, screendId : ' + vid);

            try{
                display.makeUnique(vid).then(() => {
                    hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in make unique screen');
                }).catch((e)=> {
                    hilog.error(0x0000, '[ANI]', msgStr + 'Failed to make unique screen, err: ' + e.code);
                    if (e.code === 801) {
                        hilog.info(domain, tag, caseName + 'device not support makeUnique');
                        done();
                    }
                })
            }catch (err) {
                err = err as BusinessError;
                hilog.error(0x0000, '[ANI]', msgStr + 'Failed to make unique screen, err: ' + err.code);
                if (err.code === 801) {
                        hilog.info(domain, tag, caseName + 'device not support makeUnique');
                        done();
                }
            }
            
            // 验证onAdd回调被触发，接收到有效的screenId（大于等于 1000）
            while (!callbackTriggered) {
                await Utils.msSleep(100);
            }
            hilog.info(0x0000, '[ANI]', msgStr + 'receivedScreenId: ' + receivedScreenId);
            expect(receivedScreenId >= 1000).assertTrue();
            
            // 注销监听
            display.offAdd(callback);
            hilog.info(0x0000, '[ANI]', msgStr + 'offAdd success');
            
            // 清理：销毁创建的虚拟屏
            await display.destroyVirtualScreen(vid);
            
            done();
        }
        catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, '[ANI]', msgStr + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
            if (err.code === 801) {
                hilog.info(domain, tag, caseName + 'device not support createVirtualScreen');
                done();
            }
            expect(err.code === 801).assertTrue();
            done();
        }
    });

    /**
    * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5200
    * @tc.name      testOnRemove_VirtualScreenDestroy_static_0100
    * @tc.desc      testOnRemove returns screenId when destroy virtual screen
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level3
    */
    it('testOnRemove_VirtualScreenDestroy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    let caseName : string = 'testOnRemove_VirtualScreenDestroy_static_0100';
    let msgStr : string = 'jsunittest ' + caseName + ' ';
    hilog.info(0x0000, '[ANI]', msgStr + 'begin');

    let receivedScreenId: Long = -1;
    let callbackTriggered:boolean = false;
    let callback: Callback<Long> = (screenId: Long) => {
        callbackTriggered = true
        hilog.info(0x0000, '[ANI]', msgStr + 'onRemove callback received. Data: ' + JSON.stringify(screenId));
        receivedScreenId = screenId;
    };

    let option: display.VirtualScreenConfig = {
        name: 'screen01',
        width: 100,
        height: 2340,
        density: 2,
        surfaceId: ''
    };

    try {
        // 注册监听
        display.onRemove(callback);
        hilog.info(0x0000, '[ANI]', msgStr + 'register onRemove success');

        // 创建虚拟屏
        let vid = await display.createVirtualScreen(option);
        hilog.info(0x0000, '[ANI]', msgStr + 'Success in createVirtualScreen, screendId : ' + vid);

        try{
        display.makeUnique(vid).then(() => {
            hilog.info(0x0000, '[ANI]', msgStr + 'Succeeded in make unique screen');
        }).catch((e)=> {
            hilog.error(0x0000, '[ANI]', msgStr + 'Failed to make unique screen, err: ' + e.code);
            if (e.code === 801) {
                hilog.info(domain, tag, caseName + 'device not support makeUnique');
                done();
            }
        })
        }catch (err) {
        err = err as BusinessError;
        hilog.error(0x0000, '[ANI]', msgStr + 'Failed to make unique screen, err: ' + err.code);
            if (err.code === 801) {
                    hilog.info(domain, tag, caseName + 'device not support makeUnique');
                    done();
            }
        }

        // 清理：销毁创建的虚拟屏
        await display.destroyVirtualScreen(vid);

        // 验证onRemove回调被触发，接收到有效的screenId（大于等于 1000）
        while (!callbackTriggered) {
        await Utils.msSleep(100);
        }
        hilog.info(0x0000, '[ANI]', msgStr + 'receivedScreenId: ' + receivedScreenId);
        expect(receivedScreenId >= 1000).assertTrue();

        // 注销监听
        display.offRemove(callback);
        hilog.info(0x0000, '[ANI]', msgStr + 'offAdd success');

        done();
    }
    catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, '[ANI]', msgStr + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
        if (err.code === 801) {
        hilog.info(domain, tag, caseName + 'device not support createVirtualScreen');
        done();
        }
        expect(err.code === 801).assertTrue();
        done();
    }
    });

    /**
    * @tc.number SUB_WMS_DMS_CHANGE_SETPERFERORIENTATION_STATIC_0100
    * @tc.name   testOnChange_setPreferOrientation_static_0100
    * @tc.desc   旋转后屏幕改变监听
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOnChange_setPreferOrientation_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    let caseName: string = 'testOnChange_setPreferOrientation_static_0100';
    let msgStr : string = 'jsunittest ' + caseName + ' ';
    hilog.info(0x0000, '[ANI]', msgStr + 'begin');
    let windowClass:window.Window = windowStage!.getMainWindowSync();
    try {
        if(isSupportRotate === true){
        let index1 = 0;
        let index2 = 0;
        const callback1 = (res: long)=>{
            console.info(caseName + ' callback1 res: ' + res);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
        }
        const callback2 = (res: long)=>{
            console.info(caseName + ' callback2 res: ' + res);
            index2++;
            console.info(caseName + ' callback2 index2: ' + index2);
        }
        display.onChange(callback1);
        display.onChange(callback2);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index2: ' + index2);
        expect(index1).assertLarger(0);
        expect(index2).assertLarger(0);
        display.offChange(callback1);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        await Utils.msSleep(3000);
        console.info(caseName + ' setOrientation index1: ' + index1);
        console.info(caseName + ' setOrientation index2: ' + index2);
        expect(index1).assertLarger(0);
        expect(index2).assertLarger(0);
        display.offChange();
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index2: ' + index2);
        expect(index1).assertLarger(0);
        expect(index2).assertLarger(0);
        done();
        }else{
        done();
        }

    } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
        done();
        } else {
        expect().assertFail();
        done();
        }
    }
    });

    /**
    * @tc.number SUB_WMS_DMS_CHANGE_WITH_ATTRIBUTE_SETPERFERORIENTATION_STATIC_0100
    * @tc.name   testOnChangeWithAttribute_width_height_setPreferOrientation_static_0100
    * @tc.desc   旋转后宽高精细化监听
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOnChangeWithAttribute_width_height_setPreferOrientation_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    let caseName: string = 'testOnChangeWithAttribute_width_height_setPreferOrientation_static_0100';
    let msgStr : string = 'jsunittest ' + caseName + ' ';
    hilog.info(0x0000, '[ANI]', msgStr + 'begin');
    let windowClass:window.Window = windowStage!.getMainWindowSync();
    try {
        if(isSupportRotate === true){
        let index1 = 0;
        let index2 = 0;
        const callback1 = (res: long)=>{
            console.info(caseName + ' callback1 res: ' + res);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
        }
        const callback2 = (res: long)=>{
            console.info(caseName + ' callback2 res: ' + res);
            index2++;
            console.info(caseName + ' callback2 index2: ' + index2);
        }
        display.onChangeWithAttribute(['width'], callback1);
        display.onChangeWithAttribute(['height'], callback2);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index2: ' + index2);
        expect(index1).assertEqual(1);
        expect(index2).assertEqual(1);
        display.offChange(callback1);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        await Utils.msSleep(3000);
        console.info(caseName + ' setOrientation index1: ' + index1);
        console.info(caseName + ' setOrientation index2: ' + index2);
        expect(index1).assertEqual(1);
        expect(index2).assertEqual(2);
        display.offChange();
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index2: ' + index2);
        expect(index1).assertEqual(1);
        expect(index2).assertEqual(2);
        done();
        }else{
        done();
        }

    } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
        done();
        } else {
        expect().assertFail();
        done();
        }
    }
    });

    /**
    * @tc.number SUB_WMS_DMS_CHANGE_WITH_ATTRIBUTE_SETPERFERORIENTATION_STATIC_0200
    * @tc.name   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation_static_0100
    * @tc.desc   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation_static_0100
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOnChangeWithAttribute_rotation_orientation_setPreferOrientation_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    let caseName: string = 'testOnChangeWithAttribute_width_height_setPreferOrientation_static_0100';
    let msgStr : string = 'jsunittest ' + caseName + ' ';
    hilog.info(0x0000, '[ANI]', msgStr + 'begin');
    let windowClass:window.Window = windowStage!.getMainWindowSync();

    try {
        if(isSupportRotate === true) {
        let index1 = 0;
        let index2 = 0;
        const callback1 = (res: long) => {
            console.info(caseName + ' callback1 res: ' + res);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
        }
        const callback2 = (res: long) => {
            console.info(caseName + ' callback2 res: ' + res);
            index2++;
            console.info(caseName + ' callback2 index2: ' + index2);
        }
        display.onChangeWithAttribute(['rotation'], callback1);
        display.onChangeWithAttribute(['orientation'], callback2);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index2: ' + index2);
        expect(index1).assertEqual(1);
        expect(index2).assertEqual(1);
        display.offChange(callback1);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED);
        await Utils.msSleep(3000);
        console.info(caseName + ' setOrientation index1: ' + index1);
        console.info(caseName + ' setOrientation index2: ' + index2);
        expect(index1).assertEqual(1);
        expect(index2).assertEqual(2);
        display.offChange();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index2: ' + index2);
        expect(index1).assertEqual(1);
        expect(index2).assertEqual(2);
        done();
        }else{
        done();
        }
    } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
        done();
        } else {
        expect().assertFail();
        done();
        }
    }
    });

    /**
    * @tc.number SUB_WMS_DMS_CHANGE_WITH_ATTRIBUTE_SETPERFERORIENTATION_STATIC_0300
    * @tc.name   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2_static_0100
    * @tc.desc   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2_static_0100
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    let caseName: string = 'testOnChangeWithAttribute_width_height_setPreferOrientation_static_0100';
    let msgStr : string = 'jsunittest ' + caseName + ' ';
    hilog.info(0x0000, '[ANI]', msgStr + 'begin');
    let windowClass:window.Window = windowStage!.getMainWindowSync();
    let diaplayId = display.getDefaultDisplaySync().id;
    console.info(caseName + 'diaplayId: ' + diaplayId);
    try {
        if(isSupportRotate === true) {
        let index1 = 0;
        const callback1 = (res: long) => {
            console.info(caseName + ' callback1 res: ' + res);
            expect(res).assertEqual(diaplayId);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
        }
        display.onChangeWithAttribute(['rotation', 'densityDPI'], callback1);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
        expect(index1).assertEqual(1);
        display.offChange(callback1);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        await Utils.msSleep(3000);
        console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
        expect(index1).assertEqual(1);
        done();
        }else{
        done();
        }
    } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
        done();
        } else {
        expect().assertFail();
        done();
        }
    }
    });

        /**
    * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6190
    * @tc.name      testCaptureStatusChange_VirtualScreenCreateDestroy_static_0200
    * @tc.desc      testCaptureStatusChange returns true when create virtual screen and false when destroy virtual screen
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level3
    */
    it('testCaptureStatusChange_VirtualScreenCreateDestroy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName : string = 'testCaptureStatusChange_VirtualScreenCreateDestroy_static_0200';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin');

        let captureStatus: boolean = false;
        let callbackTriggered:boolean = false;
        let callback : Callback<boolean> = (status: boolean) => {
        hilog.info(0x0000, '[ANI]', msgStr + 'capture status: ' + status);
        captureStatus = status;
        callbackTriggered = true;
        };

        let option: display.VirtualScreenConfig = {
        name: 'screen01',
        width: 100,
        height: 2340,
        density: 2,
        surfaceId: '',
        supportsFocus: false
        };

        try {

        // 注册监听
        display.onCaptureStatusChange(callback);
        hilog.info(0x0000, '[ANI]', msgStr + 'register onCaptureStatusChange success');
        await Utils.msSleep(1000);

        // 创建虚拟屏
        let vid = await display.createVirtualScreen(option);
        hilog.info(0x0000, '[ANI]', msgStr + 'Success in createVirtualScreen, screendId : ' + vid);
        await Utils.msSleep(3000);

        // 验证销毁虚拟屏后返回false
        await Utils.msSleep(3000);
        while (!callbackTriggered) {
            await Utils.msSleep(100);
        }
        hilog.info(0x0000, '[ANI]', msgStr + 'after createVirtualScreen, captureStatus: ' + captureStatus);
        expect(captureStatus === true).assertTrue();

        // 注销监听（传入callback参数）
        display.offCaptureStatusChange(callback);
        hilog.info(0x0000, '[ANI]', msgStr + 'offCaptureStatusChange success');

        // 销毁虚拟屏
        await display.destroyVirtualScreen(vid);
        hilog.info(0x0000, '[ANI]', msgStr + 'Success in destroyVirtualScreen');

        done();
        }
        catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, caseName + 'error in createVirtualScreen or destroyVirtualScreen, err : ' + JSON.stringify(err));
        if (err.code === 801) {
            hilog.info(domain, tag, caseName + 'device not support createVirtualScreen');
        }
        expect(err.code === 801).assertTrue();
        done();
        }
    });

        /**
    * @tc.number     SUB_BASIC_DMS_GET_BRIGHTNESS_INFO_static_0200
    * @tc.name       testGetBrightnessInfowithMainDisplayid_errcode_static
    * @tc.desc       查询主屏亮度信息
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level0
    */
    it('testGetBrightnessInfowithMainDisplayid_errcode_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName:string =  'testGetBrightnessInfowithMainDisplayid_errcode_static';
        try {
        let brightnessInfo = display.getBrightnessInfo(-1);
        console.log(`${caseName} brightnessInfo: ${JSON.stringify(brightnessInfo)}`);
        done();
        } catch (e) {
            e = e as BusinessError;
            console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code === 801) {
            done()
        } else {
            expect(e.code === 1400004).assertTrue();
            done();
        }
        }
    });

            /**
        * @tc.name   testConvertRelativeToGlobalCoordinatewithPosition_Normal_0100_static
        * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_NORMAL_static_0100
        * @tc.desc   验证convertRelativeToGlobalCoordinate接口
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL3
        */
        it('testConvertRelativeToGlobalCoordinatewithPosition_Normal_0100_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testConvertRelativeToGlobalCoordinatewithPosition_Normal_0100_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let relativePosition: display.RelativePosition = {
                displayId: 0,
                position: {
                x: 100,
                y: 200
                }
            };
            try {
                let displayClass:display.Display = display.getDefaultDisplaySync();
                let position: display.Position = display.convertRelativeToGlobalCoordinate(relativePosition);
                expect(position != null).assertTrue();
                expect(position.x).assertLargerOrEqual(0);
                expect(position.y).assertLargerOrEqual(0);
                done();
            } catch (e) {
                e = e as BusinessError;
                console.error(`${caseName} Failed. err: ${JSON.stringify(e)}`);
                expect(e.code).assertEqual(1400004)
                done()
            }
        })

    /**
    * @tc.number     SUB_BASIC_WMS_SPCIAL_SCREEN_SHOT_CAPTURE_ERRORCODE_static_0100
    * @tc.name       tesScreenShot_Capture_ErrorCode401_static
    * @tc.desc       tesScreenShot_Capture_ErrorCode401 when without permission
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level3
    */
    it('tesScreenShot_Capture_ErrorCode401_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName:string = 'tesScreenShot_Capture_ErrorCode401_static';
        let msgStr:string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag,msgStr + 'begin');
        try {
        let captureOptions: screenshot.CaptureOption = {
            "displayId": 0,
            "blackWindowIds": [1000]
        }
        let promise = screenshot.capture(captureOptions)
        promise.then((pixelMap: image.PixelMap) => {
            hilog.info(domain, tag,caseName + 'Succeeded in capture')
            expect(false).assertTrue()
            done()
        }).catch((err: Error):PromiseLike<void>|undefined => {
            hilog.info(domain, tag,caseName + 'Failed to capture, err: ' + err.code);
            if (err.code === 801) {
            done();
            } else {
            expect(err.code === 401).assertTrue();
            done();
            }
        })
        } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(domain, tag,caseName + 'Failed to pick Code: ' + exception.code +':msg:'+ JSON.stringify(exception.message));
        expect(exception.message!=null).assertTrue();
        if (exception.code === 801) {
            done();
        } else {
            expect(exception.code === 401).assertTrue();
            done();
        }
        };
    })

    /**
     * @tc.number SUB_WMS_DMS_CHANGE_SETPERFERORIENTATION_JUST_STATIC_0100
     * @tc.name   testonChangeWithAttribute_setPreferOrientation_static_just_0100
     * @tc.desc   旋转后屏幕改变精细化监听，空参覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testonChangeWithAttribute_setPreferOrientation_static_just_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testonChangeWithAttribute_setPreferOrientation_static_just_0100';
        let msgStr : string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin');
        let windowClass:window.Window = windowStage!.getMainWindowSync();
        try {
            if(isSupportRotate === true){
                let index = 0;
                const callback = (res: long)=>{
                    console.info(caseName + ' callback res: ' + res);
                    index++;
                    console.info(caseName + ' callback index: ' + index);
                }
                display.onChangeWithAttribute([], callback);
                await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
                await Utils.msSleep(3000);
                console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index);
                expect(index).assertEqual(0);
                display.offChange(callback);
                await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
                await Utils.msSleep(3000);
                console.info(caseName + ' setOrientation index1: ' + index);
                expect(index).assertEqual(0);
                done();
            }else{
                done();
            }

        } catch (e) {
            console.error(`${caseName} Failed. Cause: ` + e!.code);
            if (e.code === 801) {
                done();
            } else {
                expect().assertFail();
                done();
            }
        }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_ON_BRIGHTNESS_CHANGE_static_0200
     * @tc.name       testOnBrightnessInfoChange_Single_static_0100
     * @tc.desc       主屏通过调节窗口亮度触发屏幕亮度信息变化，取消监听
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testOnBrightnessInfoChange_Single_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName:string =  'testOnBrightnessInfoChange_Single_static_0100';
        try {
            let windowClass:window.Window = windowStage!.getMainWindowSync();
            console.info(`${caseName} getMainWindowSync success`);
            await windowClass.setWindowBrightness(1);
            console.info(`${caseName} setWindowBrightness 1 success`);
            await Utils.msSleep(100);
            let brightnessChangeCount1:number = 0;
            let callback1Triggered:boolean = false;

            const callback1 = (displayId: Long, brightnessInfo: display.BrightnessInfo) => {
                console.info(caseName + ' Callback1 triggered');
                console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
                brightnessChangeCount1 = brightnessChangeCount1 + 1;
                callback1Triggered = true;
                expect(displayId).assertEqual(0);
                expect(brightnessInfo.sdrNits).assertLarger(0);
                expect(brightnessInfo.currentHeadroom).assertLarger(0);
                expect(brightnessInfo.maxHeadroom).assertLarger(0);
                console.info(`${caseName} Callback1: brightnessChangeCount1 = ${brightnessChangeCount1}`);
            };
            display.onBrightnessInfoChange(callback1);
            console.info(caseName + ' Brightness change listeners registered successfully');
            await windowClass.setWindowBrightness(0);
            await Utils.msSleep(100);
            while (!callback1Triggered) {
                await Utils.msSleep(100);
            }
            console.info(`${caseName} brightnessChangeCount1 = ${brightnessChangeCount1}`);
            expect(brightnessChangeCount1).assertLarger(0);
            display.offBrightnessInfoChange(callback1);
            brightnessChangeCount1 = 0;
            await windowClass.setWindowBrightness(1);
            await Utils.msSleep(3000);
            console.info(`${caseName} after off brightnessChangeCount1 = ${brightnessChangeCount1}`);
            expect(brightnessChangeCount1).assertEqual(0);
            await windowClass.setWindowBrightness(-1);
            await Utils.msSleep(100);
            done();
        } catch (e) {
            e = e as BusinessError;
            console.error(`${caseName} Failed. Cause: ${e}`);
            if (e.code == 801) {
                done()
            } else {
                display.offBrightnessInfoChange();
                expect(false).assertTrue();
                done();
            }
        }
    });

    /**
     * @tc.number      SUB_BASIC_WMS_GET_PICK_801_Static_0100
     * @tc.name        testPick_unPC_Static
     * @tc.desc        验证折叠设备可查询到折痕区域，非折叠设备折痕区域返回空
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('testPick_unPC_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName:string = "testPick_unPC_Static";
        let msgStr:string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
        try {
            if (deviceType !== '2in1') {
                let promise = screenshot.pick();
                promise.then((pickInfo: screenshot.PickInfo) => {
                    expect(false).assertTrue();
                    done();
                }).catch((err: Error) => {
                    console.error(`Failed to pick. Code: ' + Code: ${err?.code}, message: ${err?.message}`);
                    expect(err.code === 801).assertTrue();
                    done();
                });
            } else {
              hilog.info(0x0000, '[ANI]', msgStr + 'PC can use this Interface');
              done();
            }
        } catch (exception) {
            let error = exception as BusinessError;
            console.error(`Failed to pick Code: ' + Code: ${error.code}, message: ${error.message}`);
            if (error.code === 801) {
                done()
            } else {
                expect(false).assertTrue();
                done();
            }
        };
    })

    /**
    * @tc.number      SUB_BASIC_WMS_GET_DISPLAY_CAPABILITY_Static_0100
    * @tc.name        test_get_display_capability_Static_0100
    * @tc.desc        验证折叠设备可查询到折痕区域，非折叠设备折痕区域返回空
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 3
    */
    it('test_get_display_capability_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName:string = "test_get_display_capability_Static_0100";
        let msgStr:string = 'jsunittest ' + caseName + ' ';
        hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
        try {
        let displayClass = display.getDefaultDisplaySync();
        let capabilityData:string = displayClass.getDisplayCapability();
        console.log(0x0000, '[ANI]', msgStr + 'deviceMessage =' + JSON.stringify(capabilityData));
        expect(capabilityData !== null).assertTrue();
        done();
        } catch (exception) {
        let error = exception as BusinessError;
        console.error(0x0000, '[ANI]', msgStr + `Failed Code: ' + Code: ${error.code}, message: ${error.message}`);
        if (error.code == 801) {
            done()
        } else {
            expect(false).assertTrue();
            done();
        }
        };
    })






    })

}