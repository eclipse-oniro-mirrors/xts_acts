/**
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
import { CommonModifier, SymbolGlyphModifier } from '@kit.ArkUI';
// xxx.ets
@Entry
@Component
struct ButtonExample {
  @State symbolIconModifier1: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State symbolIconModifier2: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State enabledIndex: boolean = true;
  @State enabledIndex1: boolean = true;
  @State listData: number[] = [0, 0, 0]
  @State modifier:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu1',
        enabled:this.enabledIndex,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('menu action')
        }
      },
      {
        value: 'Menu1',
        enabled:this.enabledIndex,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu1 select')
        }
      },
    ]
  )
  @State modifier3:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu2',
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('Menu2 action')
        }
      },
      {
        value: 'Menu2',
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu2 select')
        }
      },
    ]
  )

  @State modifier1:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu3',
        symbolIcon:this.symbolIconModifier1,
        enabled:true,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('Menu3 action')
        }
      },
      {
        value: 'Menu3',
        symbolIcon:this.symbolIconModifier2,
        enabled:true,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu3 select')
        }
      },
    ]
  )
  @State modifier2:CommonModifier = new CommonModifier().bindMenu(
    [
      {
        value: 'Menu4',
        symbolIcon:this.symbolIconModifier1,
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('Menu4 action')
        }
      },
      {
        value: 'Menu4',
        symbolIcon:this.symbolIconModifier2,
        enabled:false,
        icon:$r('app.media.app_icon'),
        action: () => {
          console.info('handle Menu4 select')
        }
      },
    ]
  )

  build() {
    Column() {
      Column({ space: 10 }) {
        Row(){
          Button('弹出普通菜单(modifier) 无SymbolGlyph true', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier1')
          .attributeModifier(this.modifier)

        Button('弹出普通菜单(modifier) 无SymbolGlyph false', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier2')
          .attributeModifier(this.modifier3)
        }
        Row(){
          Button('弹出普通菜单(modifier) true', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier3')
          .attributeModifier(this.modifier1)

        Button('弹出普通菜单(modifier) false', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(5)
          .height(5)
          .margin(5)
          .labelStyle({
            maxLines: 3
          })
          .id('btnModifier4')
          .attributeModifier(this.modifier2)
        }

      }
    }
  }
}
