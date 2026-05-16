/**
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
import { WaterFlowModifier } from '@ohos.arkui.modifier';

class MyWaterFlowModifier extends WaterFlowModifier {
  applyNormalAttribute(instance: WaterFlowAttribute | null | undefined): void {
    AppStorage.setOrCreate('WaterFlowModifierNullUndefined', instance);
  }
}

@Entry
@Component
struct WaterFlowModifierNullUndefined {
  @State modifier: MyWaterFlowModifier = new MyWaterFlowModifier()

  build() {
    Row() {
      Column() {
        // ========== WaterFlowModifier null and undefined tests ==========
        Text('WaterFlowModifier')

        // Test applyNormalAttribute with null
        Button('WaterFlowModifier null')
          .id('btn_waterFlowModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('WaterFlowModifier setNull: ' + AppStorage.get('WaterFlowModifierNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('WaterFlowModifier undefined')
          .id('btn_waterFlowModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('WaterFlowModifier setUndefined: ' + AppStorage.get('WaterFlowModifierNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}