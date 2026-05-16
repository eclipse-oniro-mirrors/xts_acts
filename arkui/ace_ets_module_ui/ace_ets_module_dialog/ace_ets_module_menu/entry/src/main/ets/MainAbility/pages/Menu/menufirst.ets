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
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
@Entry
@Component
struct FirstIndex {
  @State select: boolean = true
  @State arrowOffset: number = 0
  private iconStr: ResourceStr = $r("app.media.icon")
  @Builder
  ThreeLevelMenu() {
    Menu() {
      MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
      MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" }).selectIcon(true).selected(false)
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" }).selectIcon(true).selected(false)
      MenuItem({
        startIcon: this.iconStr,
        content: "菜单选项",
      }).selectIcon(true).selected(false)

      MenuItemGroup({ header: '小标题' }) {
        MenuItem({  startIcon: this.iconStr, content: "菜单选项" })
          .selectIcon(true)
          .selected(this.select)
          .onChange((selected) => {
            console.info("menuItem select" + selected);
          })
        MenuItem({
          startIcon: this.iconStr,
          content: "菜单选项",
        }).selectIcon(true).selected(false)
        MenuItem({
          startIcon: $r("app.media.icon"),
          content: "菜单选项",
        }).selectIcon(true).selected(false)
      }
    }
  }

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Column() {
        Text('右键点击弹出菜单')
          .key("menu")
          .fontWeight(FontWeight.Bold)
          .fontSize(30)
          .padding({ top: 20 })
          .bindContextMenu(this.MyMenu, ResponseType.RightClick, {enableArrow: true,arrowOffset:this.arrowOffset})
      }.height('40%')
    }.height('100%')
    .width('100%')
    .backgroundColor('#f0f0f0')
  }
 }