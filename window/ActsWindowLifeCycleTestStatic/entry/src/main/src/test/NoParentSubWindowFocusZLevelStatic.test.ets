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
import window from '@ohos.window'
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import deviceInfo from '@ohos.deviceInfo';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function NoParentSubWindowFocusZLevelStatic(): void {

    describe("NoParentSubWindowFocusZLevelStatic", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowLifeCycleTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isFreeWindowMode:boolean = false;
        let deviceType: string = deviceInfo.deviceType;
        console.info(`deviceType: ${deviceType}`);
        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(0x0000, '[ANI]','windowTest context: ' + JSON.stringify(context))
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
            let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            hilog.info(0x0000, '[ANI]',`beforeAll isFreeWindowMode: `+ isFreeWindowMode);
        })
        
    /**
     @tc.number  SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100
     @tc.name    SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100
     @tc.desc    SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100
     @tc.size    MediumTest
     @tc.type    Function
     @tc.level   LEVEL1
     */
    it('SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        const caseName = 'SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let subWindowOptions: window.SubWindowOptions = {
          title: 'SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100',
          decorEnabled: true,
          zLevelAboveParentLoosened: true
        };
        let mainWindow: window.Window = windowStage!.getMainWindowSync();
        windowStage!.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_getLastWindow_static_0100',
          subWindowOptions)
          .then(async (data: window.Window) => {
            let subWindow: window.Window = data;
            console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            expect(!!subWindow).assertTrue();
            await subWindow.showWindow();
            await Utils.msSleep(500)
            let topWindow: window.Window = await window.getLastWindow(context!);
            let mainWindowId = mainWindow.getWindowProperties().id;
            let subWindowId = subWindow.getWindowProperties().id;
            let topWindowId = topWindow.getWindowProperties().id;
            console.info(`${msgStr},mainWindowId：${mainWindowId},subWindowId:${subWindowId},topWindowId:${topWindowId}`);
            if (isFreeWindowMode) {
              expect(topWindowId).assertEqual(mainWindowId);
            } else {
              expect(topWindowId).assertEqual(subWindowId);
            }
            await subWindow.destroyWindow();
            done();
          }).catch((err: Error) => {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      }
    )
    
    })

}