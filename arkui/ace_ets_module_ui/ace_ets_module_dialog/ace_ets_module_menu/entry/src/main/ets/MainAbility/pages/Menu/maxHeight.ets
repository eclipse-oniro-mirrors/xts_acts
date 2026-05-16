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
import { SymbolGlyphModifier, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct maxHeightIndex {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State isShow3: boolean = false;
  @State isShow4: boolean = false;
  @State isShow5: boolean = false;
  @State isShow6: boolean = false;
  @State isShow7: boolean = false;
  @State isShow8: boolean = false;

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
    }.id('menu')
  }

  build() {
    Column({ space: 5 }) {
      Text('maxHeight:percent')
        .id('percent')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow1 = !this.isShow1;
        })
        .bindContextMenu(this.isShow1, this.MyMenu, {
          maxHeight:LengthMetrics.percent(0.7)
        })


      Text('maxHeight:vp')
        .id('vp')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow2 = !this.isShow2;
        })
        .bindMenu(this.isShow2, this.MyMenu,  {
          maxHeight:LengthMetrics.vp(300)
        })

      Text('maxHeight:px')
        .id('px')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow3 = !this.isShow3;
        })
        .bindContextMenu(this.isShow3, this.MyMenu, {
          maxHeight:LengthMetrics.px(400)
        })

      Text('maxHeight:fp')
        .id('fp')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow4 = !this.isShow4;
        })
        .bindMenu(this.isShow4, this.MyMenu, {
          maxHeight:LengthMetrics.fp(200)
        })

      Text('maxHeight:lpx')
        .id('lpx')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow5 = !this.isShow5;
        })
        .bindContextMenu(this.isShow5, this.MyMenu, {
          maxHeight:LengthMetrics.lpx(300)
        })

      Text('maxHeight:0')
        .id('0')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow6 = !this.isShow6;
        })
        .bindMenu(this.isShow6, this.MyMenu, {
          maxHeight:LengthMetrics.vp(0)
        })

      Text('maxHeight:-1')
        .id('-1')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow7 = !this.isShow7;
        })
        .bindMenu(this.isShow7, this.MyMenu, {
          maxHeight:LengthMetrics.vp(-1)
        })

      Text('maxHeight: undefined')
        .id('undefined')
        .fontSize(12)
        .padding(5)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow8 = !this.isShow8;
        })
        .bindMenu(this.isShow8, this.MyMenu, {
          maxHeight:LengthMetrics.vp(undefined)
        })
    }.width('100%')
  }
}
