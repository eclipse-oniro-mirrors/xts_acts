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
import { ColorMetrics } from '@ohos.arkui.node';
import { BusinessError } from '@ohos.base';

function getResourceColor(baseColor: ResourceColor):ColorMetrics {
  let sourceColor:ColorMetrics;
  try {
    sourceColor = ColorMetrics.resourceColor(baseColor)
  } catch (error) {
    console.log("getBlendColor failed, code = " + (error as BusinessError).code + ", message = " + (error as BusinessError).message);
    sourceColor = ColorMetrics.resourceColor("#19000000");
  }
  return sourceColor;
}

@Entry
@Component
struct resourceColorExample {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button("resourceColor")
        .id("resourceColor")
        .width('80%')
        .align(Alignment.Center)
        .height(50)
        .backgroundColor(getResourceColor("#ffa500").color)
    }
    .width('100%')
    .height('100%')
  }
}