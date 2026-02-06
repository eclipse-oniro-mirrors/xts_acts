/**
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
import { uiObserver, window,display } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
let windowStage_: window.WindowStage | undefined = undefined;
let subWindowClass: window.Window | undefined = undefined;

@Entry
@ComponentV2
struct MultiInstance {
  @Local message: string = 'Hello World';
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  @Env(SystemProperties.BREAK_POINT) bp: uiObserver.WindowSizeLayoutBreakpointInfo;
  @Local minLen: number = 100;
  aboutToAppear() {
    let displayClass: display.Display | null = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      this.minLen = Math.min(displayClass.width, displayClass.height);
      console.log(`minLen: ${this.minLen}`)
    } catch (exception) {
      console.error('Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
    }
  }
  private createSubWindow() {
    windowStage_ = AppStorage.get('windowStage');
    if (windowStage_ == null) {
      console.error('Failed to create the subwindow. Cause: windowStage_ is null');
    } else {
      windowStage_.createSubWindow('mySubWindow', (err: BusinessError, data) => {
        let errCode: number = err.code;
        if (errCode) {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          return;
        }
        subWindowClass = data;
        if (!subWindowClass) {
          console.error('subWindowClass is null');
          return;
        }
        AppStorage.setOrCreate('subWindowClass', subWindowClass);
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        let newX: number = this.minLen * 0.1;
        subWindowClass.moveWindowTo(newX, newX, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to move the window. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in moving the window.');
        });
        let newSizeX: number = this.minLen * 0.7;
        let newSizeY: number = this.minLen;
        console.log(`newSizeX: ${newSizeX} : newSizeY ${newSizeY}`)
        subWindowClass.resize(newSizeY, newSizeX, (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to change the window size. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in changing the window size.');
        });
        subWindowClass.setUIContent('MainAbility/pages/env/SubWindow', (err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            console.error('Failed to load the content. Cause:' + JSON.stringify(err));
            return;
          }
          console.info('Succeeded in loading the content.');
          if (!subWindowClass) {
            console.error('subWindowClass is null');
            return;
          }
          subWindowClass.showWindow((err: BusinessError) => {
            let errCode: number = err.code;
            if (errCode) {
              console.error('Failed to show the window. Cause: ' + JSON.stringify(err));
              return;
            }
            console.info('Succeeded in showing the window.');
          });
        });
      })
    }
  }

  build() {
    Column() {
      Text(`@Env`)
      Button('createSubWindow').id('EnvBtn001').height('5%').onClick(() => {
        console.log('ww createSubWindow')
        this.createSubWindow()
      })
      Text(`width${this.bp.widthBreakpoint}`)
        .height('5%')
      Text(`height ${this.bp.heightBreakpoint}`)
        .height('5%')
    }
    .height('100%')
    .width('100%')

  }
}