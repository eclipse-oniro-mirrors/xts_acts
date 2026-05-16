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
import { SideBarContainerModifier } from "@ohos.arkui.modifier";

class CustomModifier extends SideBarContainerModifier {
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.autoHide(true)
  }
}

@Entry
@Component
struct SideBarContainerExample {
  normalIcon: Resource = $r("app.media.icon")
  selectedIcon: Resource = $r("app.media.icon")
  @State arr: number[] = [1, 2]
  @State current: number = 1
  @State customModifier: SideBarContainerModifier = new CustomModifier()
    .divider({ strokeWidth: 100, color: "#FFFF0000", startMargin: 100, endMargin: 100 })
    .minContentWidth(100)
    .sideBarWidth(100)
    .minSideBarWidth(100)
    .maxSideBarWidth(100)
    .showSideBar(true)
    .controlButton({
      left: 10,
      top: 10,
      width: 10,
      height: 10
    })
    .showControlButton(true)
    .autoHide(false)
    .sideBarPosition(SideBarPosition.Start)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Column({ space: 5 }) {
              Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
              Text("Index0" + item)
                .fontSize(25)
                .fontColor(this.current === item ? '#0A59F7' : '#999')
                .fontFamily('source-sans-pro,cursive,sans-serif')
            }
            .onClick(() => {
              this.current = item
            })
          }, (item: string) => item)
        }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor('#19000000')

        Column() {
          Text('SideBarContainer content text1').fontSize(25)
          Text('SideBarContainer content text2').fontSize(25)
        }
        .margin({ top: 50, left: 20, right: 30 })
      }
      .attributeModifier(this.customModifier as CustomModifier)
        .key('sideBarContainer')
    }
    .margin({ top: 5 })
  }
}