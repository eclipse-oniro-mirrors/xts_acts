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
import { LengthUnit } from '@ohos.arkui.node';
import { LengthMetrics } from '@ohos.arkui.node'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@Component
struct MenuDividerIndex {
  @State select: boolean = true
  @State arrowOffset: number = 0
  @State text: string = ''
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_mic')).fontSize('24vp');
  @State endIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontSize('24vp');
  @State selectIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontSize('24vp');
  private iconStr: ResourceStr = $r('app.media.icon')
  private iconStr2: ResourceStr = $r('app.media.icon')

  build() {
    Column() {
      Menu(){
        MenuItemGroup({ header: '头标' , footer: '尾标' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          })
        }
        MenuItemGroup({header: 'MenuItemGroup标题' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          })
        }
      }.menuItemDivider({
        strokeWidth: { value: 1.5, unit: LengthUnit.VP},
        color: Color.Pink,
        startMargin: { value: 2, unit: LengthUnit.VP},
        endMargin: { value: 2, unit: LengthUnit.VP}})
        .key('menuItemDividerText')

      Menu(){
        MenuItemGroup({ header: '头标' , footer: '尾标' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          })
        }
        MenuItemGroup({header: 'MenuItemGroup标题' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          })
        }
      }.menuItemDivider({})
        .key('menuItemDividerText1')

      Menu(){
        MenuItemGroup({ header: '头标' , footer: '尾标' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          })
        }
        MenuItemGroup({header: 'MenuItemGroup标题' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          })
        }
      }.menuItemDivider({
        strokeWidth: { value: -1, unit: LengthUnit.VP},
        color: 'Color.Pink',
        startMargin: { value: -1, unit: LengthUnit.VP},
        endMargin: { value: -1, unit: LengthUnit.VP}})
        .key('menuItemDividerText2')

      Menu(){
        MenuItemGroup({ header: '头标' , footer: '尾标' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项1',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项2',
            endIcon: this.iconStr2
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项3',
            endIcon: this.iconStr2
          })
        }
        MenuItemGroup({header: 'MenuItemGroup标题' }){
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项一',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项二',
            endIcon: this.iconStr2,
          })
          MenuItem({
            startIcon: this.iconStr,
            content: '菜单选项三',
            endIcon: this.iconStr2,
          })
        }
      }.menuItemDivider({color: 0})
        .key('menuItemDividerText3')

      Menu(){
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
      }.menuItemGroupDivider({
        strokeWidth: LengthMetrics.vp(50), 
        color: Color.Blue,
        startMargin: LengthMetrics.vp(2),
        endMargin: LengthMetrics.vp(2),})
      .key('menuItemGroupDividerText')
      .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)

      Menu(){
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
      }.menuItemGroupDivider({})
      .key('menuItemGroupDividerText1')
      .subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)

      Menu(){
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
      }.menuItemGroupDivider({
        strokeWidth: { value: -1, unit: LengthUnit.VP},
        color: 'Color.Pink',
        startMargin: { value: -2, unit: LengthUnit.VP},
        endMargin: { value: -2, unit: LengthUnit.VP}
      })
      .key('menuItemGroupDividerText2')
      .subMenuExpandingMode(SubMenuExpandingMode.STACK_EXPAND)

      Menu(){
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
        MenuItemGroup({header: '小标题' }){
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
          MenuItem({
            symbolStartIcon: this.startIconModifier,
            content: '菜单选项',
            symbolEndIcon: this.endIconModifier
          })
        }
      }.menuItemGroupDivider({ color: 0})
      .key('menuItemGroupDividerText3')

  }.height('100%')
  .width('100%')
  .backgroundColor('#f0f0f0')
 }
}