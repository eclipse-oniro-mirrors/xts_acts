/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

@Entry
@Component
struct Index {
  @Env(SystemProperties.WINDOW_SYSTEM_DENSITY) SystemDensity: number;
  @Env(SystemProperties.WINDOW_DISPLAY_ID) DisplayId: number;
  
  aboutToAppear() {
    console.info('TestAbility index aboutToAppear');
    console.info('Index page SystemDensity: ' + this.SystemDensity);
    console.info('Index page DisplayId: ' + this.DisplayId);
    
    AppStorage.setOrCreate('SystemDensity', this.SystemDensity);
    AppStorage.setOrCreate('DisplayId', this.DisplayId);
  }
  
  @State message: string = 'Hello World'
  
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}