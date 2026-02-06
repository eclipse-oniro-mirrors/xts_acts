/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  private iconStr: Resource = $r("app.media.icon")

  @Builder
  MyMenu1() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu7")
      MenuItem({ content: "菜单选项" })
    }
    .radius(undefined)
    .key('aundefined')
  }

  @Builder
  MyMenu2() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu8")
      MenuItem({ content: "菜单选项" })
    }
    .radius(null)
    .key('anull')
  }

  @Builder
  MyMenu3() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu")
      MenuItem({ content: "菜单选项" })
    }
    .radius("30px")
    .key('aaa')
  }

  @Builder
  MyMenu6() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu1")
      MenuItem({ content: "菜单选项" })
    }
    .radius("30fp")
    .key('bbb')
  }

  @Builder
  MyMenu7() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu2")
      MenuItem({ content: "菜单选项" })
    }
    .radius("30vp")
    .key('ccc')
  }


  @Builder
  MyMenu8() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu3")
      MenuItem({ content: "菜单选项" })
    }
    .radius("20%")
    .key('ddd')
  }

  @Builder
  MyMenu9() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu4")
      MenuItem({ content: "菜单选项" })
    }
    .radius("-20vp")
    .key('menuAdd')
  }

  @Builder
  MyMenu4() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu5")
      MenuItem({ content: "菜单选项" })
    }
    .radius({topLeft: 20, topRight: 30, bottomLeft: 20, bottomRight: 10})
    .key('fff')
  }


  @Builder
  MyMenu5() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" }).id("menu6")
      MenuItem({ content: "菜单选项" })
    }
    .radius({topLeft: -20, topRight: -20, bottomLeft: -20, bottomRight: -20})
    .key('ggg')
  }


  build() {
    Column() {
      Button("radius undefined")
        .id('undefined')
        .height('10%')
        .bindMenu(this.MyMenu1(),{
          showInSubWindow: false
        })

      Button("radius:null")
        .id('null')
        .height('10%')
        .bindMenu(this.MyMenu2(),{
          showInSubWindow: false
        })

      Button("radius 30px")
        .id('num4')
        .height('10%')
        .bindMenu(this.MyMenu3(),{
          showInSubWindow: false
        })

      Button("radius 30fp")
        .id('num5')
        .height('10%')
        .bindMenu(this.MyMenu6(),{
          showInSubWindow: false
        })

      Button("radius 30vp")
        .id('num1')
        .height('10%')
        .bindMenu(this.MyMenu7(),{
          showInSubWindow: false
        })

      Button("radius 20%")
        .id('num2')
        .height('10%')
        .bindMenu(this.MyMenu8(),{
          showInSubWindow: false
        })

      Button("radius -20vp")
        .id('num3')
        .height('10%')
        .bindMenu(this.MyMenu9(),{
          showInSubWindow: false
        })

      Button("radius BorderRadiuses")
        .id('BorderRadiuses')
        .height('10%')
        .bindMenu(this.MyMenu4(),{
          showInSubWindow: false
        })

      Button("radius BorderRadiuses1")
        .id('BorderRadiuses1')
        .height('10%')
        .bindMenu(this.MyMenu5(),{
          showInSubWindow: false
        })

    }
    .backgroundColor('#f0f0f0')
    .height('100%')
    .width('100%')
  }
}