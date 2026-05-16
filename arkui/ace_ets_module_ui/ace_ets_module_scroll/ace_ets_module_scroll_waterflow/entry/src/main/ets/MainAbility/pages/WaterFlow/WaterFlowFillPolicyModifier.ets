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
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute>{
  public changeLanesValue:PresetFillType | number | undefined = -1;
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate({ fillType: this.changeLanesValue})
  }
}
@Entry
@Component
struct WaterFlowItemFillPolicyModifier {
  @State waterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State numbers: number[] = []
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];

  aboutToAppear() {
    for (let i = 1;i <= 30; i++) {
      this.numbers.push(i)
    }
  }

  build() {
    Column() {
      WaterFlow() {
        ForEach(this.numbers, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .width('100%')
                .height('20%')
                .fontSize(16)
                .textAlign(TextAlign.Center)
            }
          }.id('waterFlowType_' + item)
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }.id('waterFlow_fillType')
      .width('200vp').height('40%')
      .attributeModifier(this.waterFlowMod)
      .borderWidth(1)

      Text('ItemFillPolicy: ' + this.waterFlowMod.changeLanesValue)
        .id('waterFlow_fillType_text')
      Row(){
        Button('0')
          .height('6%')
          .id('waterFlow_fillType_0')
          .onClick(() => {
            this.waterFlowMod.changeLanesValue = PresetFillType.BREAKPOINT_DEFAULT
          })
        Button('1')
          .height('6%')
          .id('waterFlow_fillType_1')
          .margin('3%')
          .onClick(() => {
            this.waterFlowMod.changeLanesValue = PresetFillType.BREAKPOINT_SM1MD2LG3
          })
        Button('2')
          .height('6%')
          .id('waterFlow_fillType_2')
          .onClick(() => {
            this.waterFlowMod.changeLanesValue = PresetFillType.BREAKPOINT_SM2MD3LG5
          })
        Button('3')
          .height('6%')
          .id('waterFlow_fillType_3')
          .margin('3%')
          .onClick(() => {
            this.waterFlowMod.changeLanesValue = 3
          })
      }
      Button('undefined')
        .height('6%')
        .id('waterFlow_fillType_4')
        .onClick(() => {
          this.waterFlowMod.changeLanesValue = undefined
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}