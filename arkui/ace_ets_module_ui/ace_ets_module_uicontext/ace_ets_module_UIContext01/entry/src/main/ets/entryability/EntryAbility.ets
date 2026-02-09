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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam){
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.abilityWant = want;
  }

  onDestroy(){
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }
  
  onWindowStageCreate(windowStage: window.WindowStage):void{
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    let atManager: abilityAccessCtrl.AtManager  = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(this.context, [
      'ohos.permission.CAPTURE_SCREEN']).then(() => {
    }).catch((err: BusinessError) => {
      console.error(`Failed to permission CAPTURE_SCREEN.  Cause:  code: ${err.code}, message: ${err.message}`);
    });

    globalThis.windowStage = windowStage
    globalThis.abilityContext = this.context

    // 用例getWindowId测试 start
    AppStorage.SetOrCreate('getWindowIdUndefined', UIContext.resolveUIContext().getWindowId());
    console.log('wjh getWindowId before loadContent'+ UIContext.resolveUIContext().getWindowId());

    AppStorage.SetOrCreate('getWindowIdValue', UIContext.createUIContextWithoutWindow(this.context)?.getWindowId());
    console.log('wjh getWindowId id is '+ UIContext.createUIContextWithoutWindow(this.context)?.getWindowId());
    // 用例getWindowId测试 end

    windowStage.loadContent('MainAbility/pages/index/index', (err: BusinessError, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
      let windowClass: window.Window | undefined = undefined;
      windowStage.getMainWindow((err: BusinessError, data) => {
        let errCode: number = err.code;
        if (errCode) {
          console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          return;
        }
        windowClass = data;
        let isLayoutFullScreen = false;
        try {
          windowClass.setWindowLayoutFullScreen(isLayoutFullScreen, (err: BusinessError) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(`Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
              return;
            }
            console.info('Succeeded in setting the window layout to full-screen mode.');
          });
        } catch (exception) {
          console.error(`Failed to set the window layout to full-screen mode. Cause code: ${(exception as BusinessError).code}, message: ${(exception as BusinessError).message}`);
        }
  
        console.info('Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
        try {
          let properties : window.WindowProperties = windowClass.getWindowProperties();
          let wRect : window.Rect =  properties.windowRect;
          globalThis.winLeft = wRect.left;
          globalThis.winTop = wRect.top;
          console.info('Succeeded get winLeft:' + globalThis.winLeft + ',winTop:' + globalThis.winTop );
        } catch (exception) {
          console.error('Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        }
      })
    });
  }

  onWindowStageDestroy():void{
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground():void{
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground():void{
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}