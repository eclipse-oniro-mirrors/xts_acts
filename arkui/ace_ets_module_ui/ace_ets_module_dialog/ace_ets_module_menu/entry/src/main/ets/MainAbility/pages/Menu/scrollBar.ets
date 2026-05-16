/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct scrollBarIndex {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State isShow3: boolean = false;
  @State isShow4: boolean = false;
  @State logAuto: string = '';
  @State logOn: string = '';
  @State logOff: string = '';
  @State logUndefined: string = '';

 @Builder
  MyMenu() {
    Menu() {
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
    }
  }

  build() {
    Column() {
      Button('Get')
        .id('get')
        .onClick(() => {
          let isText = getInspectorByKey('auto')
          let isTextObj: ESObject = JSON.parse(isText)
          this.logAuto = 'scrollBar Auto:' + isTextObj.$attrs.bindMenu
          let isText2 = getInspectorByKey('on')
          let isTextObj2: ESObject = JSON.parse(isText2)
          this.logOn = 'scrollBar On:' + isTextObj2.$attrs.bindMenu
          let isText3 = getInspectorByKey('off')
          let isTextObj3: ESObject = JSON.parse(isText3)
          this.logOff = 'scrollBar Off:' + isTextObj3.$attrs.bindMenu
          let isText4 = getInspectorByKey('undefined')
          let isTextObj4: ESObject = JSON.parse(isText4)
          this.logUndefined = 'scrollBar undefined:' + isTextObj4.$attrs.bindMenu
        })

      Text(this.logAuto)
        .id('text1')
        .fontSize(16)
        .fontColor(Color.Blue)

      Text('scrollBar:Auto')
        .id('auto')
        .fontSize(16)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow1 = !this.isShow1;
        })
        .bindMenu(this.isShow1, this.MyMenu(), { scrollBar: BarState.Auto })

      Text(this.logOn)
        .id('text2')
        .fontSize(16)
        .fontColor(Color.Blue)

      Text('scrollBar:On')
        .id('on')
        .fontSize(16)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow2 = !this.isShow2;
        })
        .bindMenu(this.isShow2, this.MyMenu(), { scrollBar: BarState.On })

      Text(this.logOff)
        .id('text3')
        .fontSize(16)
        .fontColor(Color.Blue)

      Text('scrollBar:Off')
        .id('off')
        .fontSize(16)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow3 = !this.isShow3;
        })
        .bindMenu(this.isShow3, this.MyMenu(), { scrollBar: BarState.Off }) 

      Text(this.logUndefined)
        .id('text4')
        .fontSize(16)
        .fontColor(Color.Blue)

      Text('scrollBar:undefined')
        .id('undefined')
        .fontSize(16)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow4 = !this.isShow4;
        })
        .bindMenu(this.isShow4, this.MyMenu(), { scrollBar: undefined }) 
    }.width('100%')
  }
}
