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
import router from '@ohos.router';
import { window } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct subWindow {
  private windowStage = AppStorage.get('windowStage') as window.WindowStage;
  private mainWindow = AppStorage.get('mainWindow') as window.Window;
  private subWindow = AppStorage.get('subWindowClass') as window.Window;
  aboutToAppear(): void {

  }

  @State message: string = 'subWindow'
  build() {
    Row() {
      Blank()
        .id('subWindow')
        .backgroundColor(Color.Gray)
        .width('100%')
        .height('100%')
        .onTouch((event:TouchEvent)=>{
          if(event.type == TouchType.Down){
            let mainWindowId = this.mainWindow.getWindowProperties().id;
            let subWindowId = this.subWindow.getWindowProperties().id;
            console.log(`mainWindowId: ${mainWindowId},subWindowId:${subWindowId}`)
            this.subWindow.startMoving().then(()=>{
              console.log(`startMoving success`);
              window.shiftAppWindowPointerEvent(subWindowId,mainWindowId).then(()=>{
                console.log(`shiftAppWindowPointerEvent success`);
              }).catch((err:BusinessError)=>{
                console.log(`shiftAppWindowPointerEvent fail:${err},${err.code}`);
              })
            }).catch((err:BusinessError)=>{
              console.log(`startMoving fail:${err},${err.code}`);
            })
          }
        })
          
        .width('100%')
    }
    .height('100%')
  }
}