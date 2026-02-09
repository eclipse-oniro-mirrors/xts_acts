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
class CustomModifierFillType implements AttributeModifier<ListAttribute> {
  public changeLanesValueIndex: number = 0;
  public changeLanesValueList: (undefined | ItemFillPolicy)[] = [
    {fillType:PresetFillType.BREAKPOINT_SM1MD2LG3},{fillType:PresetFillType.BREAKPOINT_SM2MD3LG5},
    {fillType:PresetFillType.BREAKPOINT_DEFAULT},{fillType:undefined},{fillType:-1},{fillType:0}
  ]
  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes(this.changeLanesValueList[this.changeLanesValueIndex],'10px')
  }
}
@Entry
@Component
struct ListExample2 {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  scrollerForList: Scroller = new Scroller()
  @State modifier1:CustomModifierFillType = new CustomModifierFillType()
  @State arrIndex: number = 10;
  build() {
    Column() {
      Row(){
        Button('1')
          .onClick(()=> {
            this.modifier1.changeLanesValueIndex = 1
          })
          .id('modifierBtn1')
        Button('2')
          .onClick(()=> {
            this.modifier1.changeLanesValueIndex = 2
          })
          .id('modifierBtn2')
        Button('3')
          .onClick(()=> {
            this.modifier1.changeLanesValueIndex = 3
          })
          .id('modifierBtn3')
        Button('4')
          .onClick(()=> {
            this.modifier1.changeLanesValueIndex = 4
          })
          .id('modifierBtn4')
        Button('5')
          .onClick(()=> {
            this.modifier1.changeLanesValueIndex = 5
          })
          .id('modifierBtn5')
      }
      List({ scroller: this.scrollerForList}) {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .id('listType_' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(Color.Pink)
          }
        }, (item: string) => item)
      }
      .id('ListModifier')
      .listDirection(Axis.Vertical)
      .attributeModifier(this.modifier1)
      .width('200vp').height('40%')
    }
    .width('100%')
    .height('100%')
  }
}