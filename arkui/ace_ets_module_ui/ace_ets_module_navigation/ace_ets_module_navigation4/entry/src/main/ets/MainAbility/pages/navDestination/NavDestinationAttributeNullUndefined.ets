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
struct NavDestinationAttributeNullUndefinedTest {
  @State message: string = 'NavDestinationAttributeNullUndefinedTest';

  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== title tests ==========
          Text('title Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            NavDestination() {
              Text('title default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_title_default')

            // Null
            NavDestination() {
              Text('title null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_title_null')
            .title(null, null)

            // Undefined
            NavDestination() {
              Text('title undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_title_undefined')
            .title(undefined, undefined)

            // Empty String
            NavDestination() {
              Text('title empty')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_title_empty')
            .title('')
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
            NavDestination() {
              Text('backButtonIcon default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_backButtonIcon_default')

            // Null
            NavDestination() {
              Text('backButtonIcon null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_backButtonIcon_null')
            .backButtonIcon(null, null)

            // Undefined
            NavDestination() {
              Text('backButtonIcon undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_backButtonIcon_undefined')
            .backButtonIcon(undefined, undefined)

            // Empty String
            NavDestination() {
              Text('backButtonIcon empty')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_backButtonIcon_empty')
            .backButtonIcon('')
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
            NavDestination() {
              Text('menus default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_menus_default')

            // Null
            NavDestination() {
              Text('menus null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_menus_null')
            .menus(null)

            // Undefined
            NavDestination() {
              Text('menus undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_menus_undefined')
            .menus(undefined)
          }
          .width('100%')

          Divider()

          // ========== toolbarConfiguration tests ==========
          Text('toolbarConfiguration Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            NavDestination() {
              Text('toolbarConfiguration default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_toolbarConfiguration_default')

            // Null
            NavDestination() {
              Text('toolbarConfiguration null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_toolbarConfiguration_null')
            .toolbarConfiguration(null, null)

            // Undefined
            NavDestination() {
              Text('toolbarConfiguration undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_toolbarConfiguration_undefined')
            .toolbarConfiguration(undefined, undefined)
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
            NavDestination() {
              Text('ignoreLayoutSafeArea default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_ignoreLayoutSafeArea_default')

            // Null
            NavDestination() {
              Text('ignoreLayoutSafeArea null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_ignoreLayoutSafeArea_null')
            .ignoreLayoutSafeArea(null, null)

            // Undefined
            NavDestination() {
              Text('ignoreLayoutSafeArea undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_ignoreLayoutSafeArea_undefined')
            .ignoreLayoutSafeArea(undefined, undefined)

            NavDestination() {
              Text('ignoreLayoutSafeArea undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_ignoreLayoutSafeArea_empty')
            .ignoreLayoutSafeArea([], [])
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
            NavDestination() {
              Text('systemBarStyle default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_systemBarStyle_default')

            // Null
            NavDestination() {
              Text('systemBarStyle null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_systemBarStyle_null')
            .systemBarStyle(null)

            // Undefined
            NavDestination() {
              Text('systemBarStyle undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_systemBarStyle_undefined')
            .systemBarStyle(undefined)
          }
          .width('100%')

          Divider()

          // ========== customTransition tests ==========
          Text('customTransition Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            NavDestination() {
              Text('customTransition default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_customTransition_default')

            // Null
            NavDestination() {
              Text('customTransition null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_customTransition_null')
            .customTransition(null as never)

            // Undefined
            NavDestination() {
              Text('customTransition undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_customTransition_undefined')
            .customTransition(undefined)
          }
          .width('100%')

          Divider()

          // ========== preferredOrientation tests ==========
          Text('preferredOrientation Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            NavDestination() {
              Text('preferredOrientation default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_preferredOrientation_default')

            // Null
            NavDestination() {
              Text('preferredOrientation null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_preferredOrientation_null')
            .preferredOrientation(null)

            // Undefined
            NavDestination() {
              Text('preferredOrientation undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_preferredOrientation_undefined')
            .preferredOrientation(undefined)
          }
          .width('100%')

          Divider()

          // ========== enableNavigationIndicator tests ==========
          Text('enableNavigationIndicator Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            NavDestination() {
              Text('enableNavigationIndicator default')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_enableNavigationIndicator_default')

            // Null
            NavDestination() {
              Text('enableNavigationIndicator null')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_enableNavigationIndicator_null')
            .enableNavigationIndicator(null)

            // Undefined
            NavDestination() {
              Text('enableNavigationIndicator undefined')
                .fontSize(14)
            }
            .width('30%')
            .height('10%')
            .id('NavDestination_enableNavigationIndicator_undefined')
            .enableNavigationIndicator(undefined)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
