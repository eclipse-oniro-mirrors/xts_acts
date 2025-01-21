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

@Entry
@Component
struct navigationType {
  @State strokeWidthStr: string = '10px';
  @State dividerColorStr: string = '#000000';
  @State startMarginStr: string = '5px';
  @State endMarginStr: string = '5px';
  @State nullFlag: boolean = false;
  @State dividerColor: Color = Color.Red;
  private arr: number[] = [1, 2, 3];
  normalIcon: Resource = $r("app.media.icon");
  selectedIcon: Resource = $r("app.media.icon");

  build() {
    Column() {
      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, (item: string) => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .key("ArkUX_Navigation_1600")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Auto)
      .minContentWidth(50)
      .navBarWidth(100)
      .navBarWidthRange([50, 300])
      .menus([
        {
          value: "", icon: "./image/ic_public_search.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        }
      ])
      .toolBar({
        items: [
          {
            value: "aas", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "bbbsdsdsdsdbb", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "ccccassdsddcccc", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          }
        ]
      })

      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, item => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .key("ArkUX_Navigation_1700")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Stack)
      .minContentWidth(20000)
      .navBarWidth(15000)
      .navBarWidthRange([10000, 30000])
      .menus([
        {
          value: "", icon: "./image/ic_public_search.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        }
      ])
      .toolBar({
        items: [
          {
            value: "aas", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "bbbsdsdsdsdbb", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "ccccassdsddcccc", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          }
        ]
      })


      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, item => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .key("ArkUX_Navigation_1800")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Split)
      .minContentWidth(30)
      .navBarWidth(100)
      .navBarWidthRange([10, 20])
      .menus([
        {
          value: "", icon: "./image/ic_public_search.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        }
      ])
      .toolBar({
        items: [
          {
            value: "aas", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "bbbsdsdsdsdbb", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "ccccassdsddcccc", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          }
        ]
      })


      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, item => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .key("ArkUX_Navigation_1900")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .navBarWidth(100)
      .menus([
        {
          value: "", icon: "./image/ic_public_search.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        }
      ])
      .toolBar({
        items: [
          {
            value: "aas", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "bbbsdsdsdsdbb", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "ccccassdsddcccc", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          }
        ]
      })


      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, item => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .key("ArkUX_Navigation_2000")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Split)
      .minContentWidth(100)
      .navBarWidth(100)
      .navBarWidthRange([100, 100])
      .menus([
        {
          value: "", icon: "./image/ic_public_search.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        }
      ])
      .toolBar({
        items: [
          {
            value: "aas", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "bbbsdsdsdsdbb", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "ccccassdsddcccc", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          }
        ]
      })

      Navigation() {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item) => {
            ListItem() {
              NavRouter() {
                Text("NavRouter" + item)
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                NavDestination() {
                  Text("NavDestinationContent" + item)
                }
                .title("NavDestinationTitle" + item)
              }

            }
          }, item => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .key("ArkUX_Navigation_2100")
      .title("������������")
      .titleMode(NavigationTitleMode.Mini)
      .mode(NavigationMode.Split)
      .minContentWidth("40%")
      .navBarWidth("30%")
      .navBarWidthRange(["20%", "50%"])
      .menus([
        {
          value: "", icon: "./image/ic_public_search.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        },
        {
          value: "", icon: "./image/ic_public_add.svg", action: () => {
        }
        }
      ])
      .toolBar({
        items: [
          {
            value: "aas", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "bbbsdsdsdsdbb", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          },
          {
            value: "ccccassdsddcccc", icon: "./image/ic_public_highlights.svg", action: () => {
          }
          }
        ]
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}