/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

@Entry
@Component
struct navigationTest {
  aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        List({ space: 0, initialIndex: 0 }) {
          ListItem() {
            Navigation() {
            }
            .key("ArkUX_Stage_Navigation_0100")
            .title({ main: 'title', sub: "SubTitle" })
            .menus([
              {
                value: "m1", icon: 'resources/base/media/icon.png', action: () => {
                console.log("m1")
              }
              },
              {
                value: "m2", icon: 'resources/base/media/icon.png', action: () => {
                console.log("m2")
              }
              },
              {
                value: "m2", icon: 'resources/base/media/icon.png', action: () => {
                console.log("m2")
              }
              },
              {
                value: "m2", icon: 'resources/base/media/icon.png', action: () => {
                console.log("m2")
              }
              },

              {
                value: "m3", icon: 'resources/base/media/icon.png', action: () => {
                console.log("m3")
              }
              }])
            .titleMode(NavigationTitleMode.Free)
            .toolbarConfiguration([
              {
                value: "app",
                icon: 'resources/base/media/star_icon.svg',
                status: ToolbarItemStatus.NORMAL,
                action: () => {
                  console.log("app")
                }
              },
              {
                value: "add", icon: 'resources/base/media/star_icon.svg',
                status: ToolbarItemStatus.DISABLED,
                action: () => {
                  console.log("add")
                }
              },
              {
                value: "1",
                icon: 'resources/base/media/star_icon.svg',
                status: ToolbarItemStatus.ACTIVE,
                activeIcon: 'resources/base/media/star_icon.svg',
                action: () => {
                  console.log("collect")
                }
              },
              {
                value: "share", icon: 'resources/base/media/star_icon.svg', action: () => {
                console.log("share")
              }
              },
              {
                value: "delete", icon: 'resources/base/media/star_icon.svg', action: () => {
                console.log("delete")
              }
              },
              {
                value: 'select', icon: 'resources/base/media/star_icon.svg', action: () => {
                console.log("select")
              }
              }])
            .hideTitleBar(false)
            .hideToolBar(false)
            .hideBackButton(false)
            .mode(NavigationMode.Stack)
            .onTitleModeChange((titleModel: NavigationTitleMode) => {
              console.info('titleMode' + titleModel)
            })
          }
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
