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
import { uiObserver, window,UIUtils,display } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
let subWindowClass: window.Window | undefined = undefined;
let envNum: number = 0;
@Entry
@ComponentV2
struct SubWindow {
  @Local message: string = 'SubWindow';
  @Local change: number = 0;
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  @Local screenWidth: number = 100;
  @Local screenHeight: number = 100;
  @Local minLen: number = 100;

  private resize(width: number, height: number) {
    window.getLastWindow(this.context).then((lastWindow) => {
      lastWindow.resize(width,height)
    });
  }
  private destroySubWindow(){
    subWindowClass = AppStorage.get('subWindowClass');
    if (!subWindowClass) {
      console.error('sub_windowClass is null');
      return;
    }
    subWindowClass.destroyWindow((err: BusinessError) => {
      let errCode: number = err.code;
      if (errCode) {
        console.error('Failed to destroy the window. Cause: ' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in destroying the window.');
    });
  }

  orientationChange(mon: IMonitor) {
    envNum++;
    mon.dirty.forEach((path: string) => {
      console.info(`${path} changes from ww ${mon.value(path)?.before} to ${mon.value(path)?.now}`);
    })
  }

  @Env(SystemProperties.BREAK_POINT) bp: uiObserver.WindowSizeLayoutBreakpointInfo;
  aboutToAppear(): void {
    // @Env返回的对象实际上是@ObservedV2装饰的对象（其属性是@Trace装饰的），所以其属性的改变可以通过addMonitor监听
    UIUtils.addMonitor(this.bp, ['widthBreakpoint', 'heightBreakpoint'], this.orientationChange);
    let displayClass: display.Display | null = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      this.minLen = Math.min(displayClass.height, displayClass.width)
      console.log(`minLen: ${this.minLen}`)
    } catch (exception) {
      console.error('Failed to obtain the default display object. Code: ' + JSON.stringify(exception));
    }
  }
  build() {
    Column() {
      Button(`${this.change}`).id('subWindowBtn001').height('20%').onClick(() => {
        console.log('ww this.change')
        this.change = envNum;
      })
      Text(`Sub width ${this.bp.widthBreakpoint}`)
      .height('5%')

      Text(`Sub height ${this.bp.heightBreakpoint}`)
        .height('5%')
      Button('destroySubWindow')
        .id('subWindowBtn003')
        .onClick(() => {
        this.destroySubWindow()
      })
      Button('resize').height('20%').id('subWindowBtn002').onClick(() => {
        console.log('ww subwindows resize')
        let newSizeX: number = this.minLen;
        let newSizeY: number = this.minLen;
        console.log(`newSizeX: ${newSizeX} : newSizeY ${newSizeY}`)
        this.resize(newSizeX, newSizeY)
      })
      Comp({ breakpoint: this.bp })

    }
    .backgroundColor(Color.Pink)
    .height('100%')
    .width('100%')

  }
}

@Component
struct Comp {
  @Require breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      Text(`Comp width: ${this.breakpoint.widthBreakpoint}`).height('5%')
      Text(`Comp height: ${this.breakpoint.heightBreakpoint}`).height('5%')
    }
  }
}