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
import { GridDataSource } from './GridDataSource';

class GridFileTypeModifier implements AttributeModifier <GridAttribute> {
  public fileType: PresetFillType = PresetFillType.BREAKPOINT_DEFAULT;
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate( {fillType :this.fileType});
  }
}

@Entry
@Component
struct GridModifierExample {
  @State fileTypeModifier : GridFileTypeModifier = new GridFileTypeModifier();
  @State fileTypePool : PresetFillType[]  = [ PresetFillType.BREAKPOINT_DEFAULT,
    PresetFillType.BREAKPOINT_SM1MD2LG3, PresetFillType.BREAKPOINT_SM2MD3LG5, 4];
  @State fileTypeIndex : number = 0;
  @State fileType:PresetFillType = PresetFillType.BREAKPOINT_DEFAULT;
  @State clipContent: ContentClipMode | RectShape | undefined = undefined;

  numbers: GridDataSource = new GridDataSource([]);
  scroller: Scroller = new Scroller();

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 0; i <= 10; i++) {
      for (let j = 0; j < 5; j++) {
        list.push(j.toString());
      }
    }
    this.numbers = new GridDataSource(list);
  }

  build() {
    Column({ space: 5 }) {
      Grid(this.scroller) {
        LazyForEach(this.numbers, (day: string, index?: number) => {
          GridItem() {
            Text(day)
              .id('gridType_' + index)
              .fontSize(16)
              .backgroundColor(0xF9CF93)
              .width('80%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (index: number) => index.toString())
      }
      .id('GridTemplate_STR')
      .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true, effectEdge: EffectEdge.START })
      .width('200vp')
      .backgroundColor(0xDCDCDC)
      .height('30%')
      .attributeModifier(this.fileTypeModifier)
      Text('ItemFillPolicy: ' + this.fileTypeModifier.fileType).id('GridTemplate_STR0')
      Button('FileType:' + this.fileTypeIndex ).onClick(() => {
        this.fileTypeIndex = (this.fileTypeIndex + 1) % this.fileTypePool.length;
        this.fileTypeModifier.fileType  = this.fileTypePool[this.fileTypeIndex]
      }).id('ButtonSTR').height('6%')

    }.width('100%').margin({ top: 5 })
  }
}