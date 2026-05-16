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

import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_mic'));
  @State expandSymbolModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.checkmark'));
  @State subMenuExpandSymbol0: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.chevron_forward')).fontSize('20vp').padding('2vp');
  @State subMenuExpandSymbol1: SymbolGlyphModifier | undefined = undefined;
  @State subMenuExpandSymbol2: SymbolGlyphModifier | null = null;
  @State subMenuExpandSymbol3: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.chevron_down')).fontSize('24vp');
  @State subMenuExpandSymbol4: SymbolGlyphModifier | undefined = undefined;
  @State subMenuExpandSymbol5: SymbolGlyphModifier | null = null;
  @State text1: string = '';
  @State text2: string = '';
  @State text3: string = '';
  @State text4: string = '';
  @State text5: string = '';
  @State text6: string = '';
  @State text7: string = '';

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({  content: '图标' ,endIcon:$r('app.media.app_icon')})
      MenuItem({  content: '列表' })
    }
  }

  @Builder
  MyMenu1() {
    Menu() {
      MenuItem({ symbolStartIcon: this.startIconModifier, content: '新建文件夹', builder: (): void => this.SubMenu() })
      MenuItemGroup() {
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '排序方式',
          builder: (): void => this.SubMenu(),
        }).id('MenuItem1')
          .borderRadius('300.00vp')
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '查看方式',
        })
      }
    }.width(200).subMenuExpandingMode(SubMenuExpandingMode.STACK_EXPAND)
    .subMenuExpandSymbol(this.subMenuExpandSymbol0)
  }

  @Builder
  MyMenu2() {
    Menu() {
      MenuItem({ symbolStartIcon: this.startIconModifier, content: '新建文件夹', builder: (): void => this.SubMenu() })
      MenuItemGroup() {
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '排序方式',
          builder: (): void => this.SubMenu(),
        }).id('MenuItem2')
          .borderRadius('300.00vp')
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '查看方式',
        })
      }
    }.width(200).subMenuExpandingMode(SubMenuExpandingMode.STACK_EXPAND)
    .subMenuExpandSymbol(this.subMenuExpandSymbol1)
  }

  @Builder
  MyMenu3() {
    Menu() {
      MenuItem({ symbolStartIcon: this.startIconModifier, content: '新建文件夹', builder: (): void => this.SubMenu() })
      MenuItemGroup() {
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '排序方式',
          builder: (): void => this.SubMenu(),
        }).id('MenuItem3')
          .borderRadius('300.00vp')
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '查看方式',
        })
      }
    }.width(200).subMenuExpandingMode(SubMenuExpandingMode.STACK_EXPAND)
    .subMenuExpandSymbol(this.subMenuExpandSymbol2)
  }

  @Builder
  MyMenu4() {
    Menu() {
      MenuItem({ symbolStartIcon: this.startIconModifier, content: '新建文件夹', builder: (): void => this.SubMenu() })
      MenuItemGroup() {
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '排序方式',
          builder: (): void => this.SubMenu(),
        }).id('MenuItem4')
          .borderRadius('300.00vp')
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '查看方式',
        })
      }
    }.width(200).subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)
    .subMenuExpandSymbol(this.subMenuExpandSymbol3)
  }

  @Builder
  MyMenu5() {
    Menu() {
      MenuItem({ symbolStartIcon: this.startIconModifier, content: '新建文件夹', builder: (): void => this.SubMenu() })
      MenuItemGroup() {
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '排序方式',
          builder: (): void => this.SubMenu(),
        }).id('MenuItem5')
          .borderRadius('300.00vp')
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '查看方式',
        })
      }
    }.width(200).subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)
    .subMenuExpandSymbol(this.subMenuExpandSymbol4)
  }

  @Builder
  MyMenu6() {
    Menu() {
      MenuItem({ symbolStartIcon: this.startIconModifier, content: '新建文件夹', builder: (): void => this.SubMenu() })
      MenuItemGroup() {
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '排序方式',
          builder: (): void => this.SubMenu(),
        }).id('MenuItem6')
          .borderRadius('300.00vp')
        MenuItem({
          symbolStartIcon: this.startIconModifier,
          content: '查看方式',
        })
      }
    }.width(200).subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)
    .subMenuExpandSymbol(this.subMenuExpandSymbol5)
  }

  build() {
    Column() {
      Row(){
        Button('1').bindMenu(this.MyMenu1).id('btn1')
          .onClick(() => {
            if(this.subMenuExpandSymbol0){
              this.text1 = 'sys.symbol.chevron_forward'
            }
          })
        Button('2').bindMenu(this.MyMenu2).id('btn2')
          .onClick(() => {
            if(this.subMenuExpandSymbol1 == undefined){
              this.text2 = 'sys.symbol.chevron_forward'
            }
          })
        Button('3').bindMenu(this.MyMenu3).id('btn3')
          .onClick(() => {
            if(this.subMenuExpandSymbol2 == null){
              this.text3= 'sys.symbol.chevron_forward'
            }
          })
        Button('4').bindMenu(this.MyMenu4).id('btn4')
          .onClick(() => {
            if (this.subMenuExpandSymbol3) {
              this.text4 = 'sys.symbol.chevron_down'
            }
          })
        Button('5').bindMenu(this.MyMenu5).id('btn5')
          .onClick(() => {
            if (this.subMenuExpandSymbol4 == undefined) {
              this.text5 = 'sys.symbol.chevron_down'
            }
          })
        Button('6').bindMenu(this.MyMenu6).id('btn6')
          .onClick(() => {
            if (this.subMenuExpandSymbol5 == null) {
              this.text6 = 'sys.symbol.chevron_down'
            }
          })
      }.margin({top: '5%'})
      Column(){
        Text(''+ this.text1).id('text1').fontSize(5)
        Text(''+ this.text2).id('text2').fontSize(5)
        Text(''+ this.text3).id('text3').fontSize(5)
        Text(''+ this.text4).id('text4').fontSize(5)
        Text(''+ this.text5).id('text5').fontSize(5)
        Text(''+ this.text6).id('text6').fontSize(5)
      }
    }
    .width('100%')
  }
}