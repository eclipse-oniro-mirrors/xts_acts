/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct NavigationAttributeNullUndefined {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== navBarWidth tests ==========
          Text('navBarWidth Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('navBarWidth default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_navBarWidth_default')
            .mode(NavigationMode.Split)

            // Null
            Navigation() {
              Text('navBarWidth null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_navBarWidth_null')
            .mode(NavigationMode.Split)
            .navBarWidth(null)

            // Undefined
            Navigation() {
              Text('navBarWidth undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_navBarWidth_undefined')
            .mode(NavigationMode.Split)
            .navBarWidth(undefined)
          }
          .width('100%')

          Divider()

          // ========== minContentWidth tests ==========
          Text('minContentWidth Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('minContentWidth default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_minContentWidth_default')
            .mode(NavigationMode.Split)

            // Null
            Navigation() {
              Text('minContentWidth null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_minContentWidth_null')
            .mode(NavigationMode.Split)
            .minContentWidth(null)

            // Undefined
            Navigation() {
              Text('minContentWidth undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_minContentWidth_undefined')
            .mode(NavigationMode.Split)
            .minContentWidth(undefined)
          }
          .width('100%')

          Divider()

          // ========== menus tests ==========
          Text('menus Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('menus default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_menus_default')

            // Null
            Navigation() {
              Text('menus null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_menus_null')
            .menus(null, undefined)

            // Undefined
            Navigation() {
              Text('menus undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_menus_undefined')
            .menus(undefined, null)
          }
          .width('100%')

          Divider()

          // ========== toolBar tests ==========
          Text('toolBar Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('toolBar default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_toolBar_default')

            // Null
            Navigation() {
              Text('toolBar null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_toolBar_null')
            .toolBar(null)

            // Undefined
            Navigation() {
              Text('toolBar undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_toolBar_undefined')
            .toolBar(undefined)
          }
          .width('100%')

          Divider()

          // ========== enableToolBarAdaptation tests ==========
          Text('enableToolBarAdaptation Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('enableToolBarAdaptation default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableToolBarAdaptation_default')

            // Null
            Navigation() {
              Text('enableToolBarAdaptation null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableToolBarAdaptation_null')
            .enableToolBarAdaptation(null)

            // Undefined
            Navigation() {
              Text('enableToolBarAdaptation undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableToolBarAdaptation_undefined')
            .enableToolBarAdaptation(undefined)
          }
          .width('100%')

          Divider()

          // ========== systemBarStyle tests ==========
          Text('systemBarStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('systemBarStyle default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_systemBarStyle_default')

            // Null
            Navigation() {
              Text('systemBarStyle null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_systemBarStyle_null')
            .systemBarStyle(null)

            // Undefined
            Navigation() {
              Text('systemBarStyle undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_systemBarStyle_undefined')
            .systemBarStyle(undefined)
          }
          .width('100%')

          Divider()

          // ========== recoverable tests ==========
          Text('recoverable Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('recoverable default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_recoverable_default')
            .title('123')

            // Null
            Navigation() {
              Text('recoverable null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_recoverable_null')
            .id('test_recoverable_null')
            .recoverable(null)
            .title('123')

            // Undefined
            Navigation() {
              Text('recoverable undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_recoverable_undefined')
            .id('test_recoverable_undefined')
            .recoverable(undefined)
            .title('123')
          }
          .width('100%')

          Divider()

          // ========== enableDragBar tests ==========
          Text('enableDragBar Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('enableDragBar default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableDragBar_default')
            .mode(NavigationMode.Split)

            // Null
            Navigation() {
              Text('enableDragBar null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableDragBar_null')
            .mode(NavigationMode.Split)
            .enableDragBar(null)

            // Undefined
            Navigation() {
              Text('enableDragBar undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableDragBar_undefined')
            .mode(NavigationMode.Split)
            .enableDragBar(undefined)
          }
          .width('100%')

          Divider()

          // ========== enableModeChangeAnimation tests ==========
          Text('enableModeChangeAnimation Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('enableModeChangeAnimation default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableModeChangeAnimation_default')

            // Null
            Navigation() {
              Text('enableModeChangeAnimation null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableModeChangeAnimation_null')
            .enableModeChangeAnimation(null)

            // Undefined
            Navigation() {
              Text('enableModeChangeAnimation undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableModeChangeAnimation_undefined')
            .enableModeChangeAnimation(undefined)
          }
          .width('100%')

          Divider()

          // ========== splitPlaceholder tests ==========
          Text('splitPlaceholder Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('splitPlaceholder default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_splitPlaceholder_default')
            .mode(NavigationMode.Split)

            // Null
            Navigation() {
              Text('splitPlaceholder null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_splitPlaceholder_null')
            .mode(NavigationMode.Split)
            .splitPlaceholder(null)

            // Undefined
            Navigation() {
              Text('splitPlaceholder undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_splitPlaceholder_undefined')
            .mode(NavigationMode.Split)
            .splitPlaceholder(undefined)
          }
          .width('100%')

          Divider()

          // ========== enableVisibilityLifecycleWithContentCover tests ==========
          Text('enableVisibilityLifecycleWithContentCover Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('enableVisibilityLifecycleWithContentCover default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableVisibilityLifecycleWithContentCover_default')

            // Null
            Navigation() {
              Text('enableVisibilityLifecycleWithContentCover null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableVisibilityLifecycleWithContentCover_null')
            .enableVisibilityLifecycleWithContentCover(null)

            // Undefined
            Navigation() {
              Text('enableVisibilityLifecycleWithContentCover undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_enableVisibilityLifecycleWithContentCover_undefined')
            .enableVisibilityLifecycleWithContentCover(undefined)
          }
          .width('100%')

          Divider()

          // ========== backButtonIcon tests ==========
          Text('backButtonIcon Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('backButtonIcon default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_backButtonIcon_default')

            // Null
            Navigation() {
              Text('backButtonIcon null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_backButtonIcon_null')
            .backButtonIcon(null)

            // Undefined
            Navigation() {
              Text('backButtonIcon undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_backButtonIcon_undefined')
            .backButtonIcon(undefined, undefined)

            // Empty String
            Navigation() {
              Text('backButtonIcon empty')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_backButtonIcon_empty')
            .backButtonIcon('', null)
          }
          .width('100%')

          Divider()

          // ========== customNavContentTransition tests ==========
          Text('customNavContentTransition Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('customNavContentTransition default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_customNavContentTransition_default')

            // Null
            Navigation() {
              Text('customNavContentTransition null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_customNavContentTransition_null')
            .customNavContentTransition(null as never)

            // Undefined
            Navigation() {
              Text('customNavContentTransition undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_customNavContentTransition_undefined')
            .customNavContentTransition(undefined)
          }
          .width('100%')

          Divider()

          // ========== ignoreLayoutSafeArea tests ==========
          Text('ignoreLayoutSafeArea Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('ignoreLayoutSafeArea default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_ignoreLayoutSafeArea_default')

            // Null
            Navigation() {
              Text('ignoreLayoutSafeArea null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_ignoreLayoutSafeArea_null')
            .ignoreLayoutSafeArea(null, null)

            // Undefined
            Navigation() {
              Text('ignoreLayoutSafeArea undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_ignoreLayoutSafeArea_undefined')
            .ignoreLayoutSafeArea(undefined, undefined)
            // []
            Navigation() {
              Text('ignoreLayoutSafeArea undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_ignoreLayoutSafeArea_undefined')
            .ignoreLayoutSafeArea([], [])
          }
          .width('100%')

          Divider()

          // ========== divider tests ==========
          Text('divider Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Navigation() {
              Text('divider default')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_divider_default')
            .mode(NavigationMode.Split)

            // Null
            Navigation() {
              Text('divider null')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_divider_null')
            .mode(NavigationMode.Split)
            .divider(null)

            // Undefined
            Navigation() {
              Text('divider undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('5%')
            .id('navigation_divider_undefined')
            .mode(NavigationMode.Split)
            .divider(undefined)
          }
          .width('100%')
        }
        .width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
