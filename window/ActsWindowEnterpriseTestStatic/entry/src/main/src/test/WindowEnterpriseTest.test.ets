/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage ,LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
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
        resolve(windowStageStart);
    })
}
async function terminateAbility(caseName: string) {
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    try {
        if (pageContext !== null && pageContext !== undefined) {
            console.log(`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            console.log(`${caseName} terminateSelf success`);
        }).catch((err: Error):PromiseLike<void>|undefined => {
            console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        e = e as BusinessError;
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowEnterpriseTest() {

    describe("WindowEnterpriseTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowEnterpriseTest describe start');
        hilog.info(domain, tag, 'WindowEnterpriseTest start');
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(async () => {
            hilog.info(domain, tag, 'beforeAll start');
            let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            hilog.info(domain, tag, 'beforeAll AbilityDelegator');
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswindowtest.static")
            await Utils.msSleep(2000);
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                hilog.info(domain, tag, 'jsUnittest beforeAll windowStage =' + windowStage);
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                hilog.info(domain, tag, 'jsUnittest beforeAll win =' + win);
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                hilog.info(domain, tag, 'jsUnittest beforeAll context =' + context);

            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            hilog.info(domain, tag, '%{public}s', 'getANI context = ' + JSON.stringify(context));

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(0x0000, '[ANI]',`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(0x0000, '[ANI]',`beforeAll isPCStatus: `+ isPCStatus);
        })
        /**
         * @tc.number     SUB_BASIC_WMS_GET_VISIBLEWINDOWINFO_static_0100
         * @tc.name       test_GET_VISIBLEWINDOWINFO_static_0100
         * @tc.desc       test_GET_VISIBLEWINDOWINFO_static_0100
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('test_GET_VISIBLEWINDOWINFO_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_GET_VISIBLEWINDOWINFO_static_0100 ';
            hilog.info(domain, tag,caseName + 'begin');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context!);
            try {
                let windowClass2:window.Window = windowStageStart.getMainWindowSync();
                let res:window.WindowProperties = windowClass2.getWindowProperties()
                hilog.info(domain, tag,caseName + 'res: ' + JSON.stringify(res));
                window.getVisibleWindowInfo().then((infos: Array<window.WindowInfo>) => {
                    hilog.info(domain, tag,caseName + 'Succeeded in calling getVisibleWindowInfo.');
                    hilog.info(domain, tag,caseName + `infos.length: ${infos.length}`);
                    expect(infos.length).assertLargerOrEqual(1);
                    let isExit:boolean = false;
                    for (let i = 0; i < infos.length; i++) {
                        if (infos[i].windowId === res.id) {
                            isExit = true;
                            let info = infos[i];
                            hilog.info(domain, tag,caseName + 'info: ' + JSON.stringify(info));
                            hilog.info(domain, tag,caseName + `info.windowStatusType: ${info.windowStatusType}`);
                            hilog.info(domain, tag,caseName + `info.bundleName: ${info.bundleName}`);
                            hilog.info(domain, tag,caseName + `info.abilityName: ${info.abilityName}`);
                            hilog.info(domain, tag,caseName + `info.globalDisplayRect: ${info.globalDisplayRect}`);
                            hilog.info(domain, tag,caseName + `info.isFocused: ${info.isFocused}`);

                            hilog.info(domain, tag,caseName + `res.windowRect.left: ${res.windowRect.left}`);
                            hilog.info(domain, tag,caseName + `res.windowRect.top: ${res.windowRect.top}`);
                            hilog.info(domain, tag,caseName + `res.windowRect.width: ${res.windowRect.width}`);
                            hilog.info(domain, tag,caseName + `res.windowRect.height: ${res.windowRect.height}`);
                            expect(info.rect.left).assertEqual(res.windowRect.left);
                            expect(info.rect.top).assertEqual(res.windowRect.top);
                            expect(info.rect.width).assertEqual(res.windowRect.width);
                            expect(info.rect.height).assertEqual(res.windowRect.height);
                            expect(info.isFocused).assertEqual(true);
                            break;
                        }
                    }
                    if (!isExit) {
                        hilog.error(domain, tag,`${caseName} failed, there is no match windowId.`);
                        await terminateAbility(caseName);
                        expect(false).assertTrue();
                        done()
                    }
                    await terminateAbility(caseName);
                    done();
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,caseName + 'Failed to call getVisibleWindowInfo. Cause: ' +' code:' +err.code+'msg:'+ err.message);
                    await terminateAbility(caseName);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        hilog.info(domain, tag,`${caseName} deviceType does not supported this Capability`);
                        done()
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                    
                });
            } catch (err) {
                err = err as BusinessError;
                await terminateAbility(caseName);
                hilog.info(domain, tag,`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });
        






    })

}