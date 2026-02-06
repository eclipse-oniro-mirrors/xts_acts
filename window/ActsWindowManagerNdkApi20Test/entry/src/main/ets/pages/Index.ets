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
import windowndkapi20 from 'libwindowndkapi20.so';
import { floatingBall, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct Index {
  @State currentStatus: string = 'init';
  @State floattingcontent: string = 'create';
  @State currentWindowId: number = 0;
  private floatingBallController: floatingBall.FloatingBallController | undefined = undefined;
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private window: window.Window | undefined = undefined;
  aboutToAppear():void{
    // 通过C-API创建节点，并添加到管理器nodeContent上
    window.getLastWindow(this.context).then((win) => {
      this.window = win;
      this.currentWindowId = this.window.getWindowProperties().id;
      // 传递屏幕ID到Native
      windowndkapi20.GetDisplayId(this.window.getWindowProperties().displayId);
    });
  }

  build() {
    Scroll() {
      Column() {
        Text(this.currentStatus)
        Button('CreatePipConfigIncorrectParam').onClick((event: ClickEvent) => {
          let result: number = windowndkapi20.CaptureScreenPixelmapInvalidParamOrDeviceNotSupported();
          console.info(`====>CreatePipConfigIncorrectParam<====` + '\nNdkResult:' + `${result}`);
          this.currentStatus = 'CreatePipConfigIncorrectParam NdkResult:' + result;
        })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
