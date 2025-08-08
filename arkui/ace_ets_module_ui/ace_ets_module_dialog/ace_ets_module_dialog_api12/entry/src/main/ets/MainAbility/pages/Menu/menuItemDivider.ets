/**
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



@Entry
@Component
struct menuItemDividerTest {
  @State text: string = ''
  private iconStr: ResourceStr = $r('app.media.icon')
  private iconStr2: ResourceStr = $r('app.media.icon')
  @State select: boolean = true;


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
        endMargin: { value: 2, unit: LengthUnit.VP}}).key('menuItemDividerText')
    }
    .width('100%')
  }
}