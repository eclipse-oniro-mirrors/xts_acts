/**
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
import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ColorMetricsTest {
  @State errorStr401: string = '';

  build() {
    Column() {
      Button('ResourceColor ErrorCode 401').id('error_button401_id')
        .width('80%')
        .onClick(() => {
          let sourceColor: ColorMetrics = ColorMetrics.resourceColor(Color.Red);
          try {
            sourceColor.blendColor(null);
          } catch (e) {
            this.errorStr401 = (e as BusinessError).code + '';
          }
        })

      Text(this.errorStr401).id('error_401_id')
    }
    .width('100%')
    .height('100%')
  }
}