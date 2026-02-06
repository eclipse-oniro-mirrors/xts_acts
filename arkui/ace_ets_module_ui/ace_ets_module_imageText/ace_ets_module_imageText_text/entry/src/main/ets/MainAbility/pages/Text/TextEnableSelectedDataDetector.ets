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

@Entry
@Component
struct TextEnableSelectedDataDetectorTest {
  build() {
    Column() {
      Text('text_enableSelectedDataDetector_true_LocalDevice')
        .id('text_enableSelectedDataDetector_true_LocalDevice')
        .enableSelectedDataDetector(true)
        .copyOption(CopyOptions.LocalDevice)
        .height('5%')

      Text('text_enableSelectedDataDetector_true_CROSS_DEVICE')
        .id('text_enableSelectedDataDetector_true_CROSS_DEVICE')
        .enableSelectedDataDetector(true)
        .copyOption(CopyOptions.CROSS_DEVICE)
        .height('5%')

      Text('text_enableSelectedDataDetector_false')
        .id('text_enableSelectedDataDetector_false')
        .enableSelectedDataDetector(false)
        .height('5%')

      Text('text_enableSelectedDataDetector_undefined')
        .id('text_enableSelectedDataDetector_undefined')
        .enableSelectedDataDetector(undefined)
        .height('5%')

      Text('text_enableSelectedDataDetector_default')
        .id('text_enableSelectedDataDetector_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}