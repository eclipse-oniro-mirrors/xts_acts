/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import window from '@ohos.window';

@Entry
@Component
struct Index3 {
  @Env(SystemProperties.WINDOW_SIZE) windowSizeVP: window.SizeInVP;
  @Env(SystemProperties.WINDOW_SIZE_PX) windowSizePX: window.Size;
  private caseName: string = 'testEnvSystemPropertiesWindowSizewithMainwindow|testEnvSystemPropertiesWindowSizewithSubwindow';
  build() {
    Row() {
      Column() {
        Button()
          .id('index3Btn')
          .onClick(()=>{
            console.log(this.caseName + ' page Index3 this.windowSizeVP: ' + JSON.stringify(this.windowSizeVP))
            console.log(this.caseName + ' page Index3 this.windowSizePX: ' + JSON.stringify(this.windowSizePX))
            if (this.windowSizeVP && this.windowSizePX) {
              AppStorage.setOrCreate('windowSizeVP width', this.windowSizeVP.width);
              AppStorage.setOrCreate('windowSizeVP height', this.windowSizeVP.height);
              AppStorage.setOrCreate('windowSizePX width', this.windowSizePX.width);
              AppStorage.setOrCreate('windowSizePX height', this.windowSizePX.height);
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}