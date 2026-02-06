/*
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
@Entry
@Component
struct badgeTest {

  aboutToAppear(){
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Row() {
      Column() {
            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red ,fontWeight: 0}
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(0x317aff)
            }
            .width(100).height(50)
            .key('ArkUX_Stage_Badge_FontWeight_0100')

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 400 }
            }) {
              Text('test')
                .width(100).height(50)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0200')
            .width(100).height(50)

            Badge({
              value: 'new',
              style: { badgeSize: 6, badgeColor: '#FA2A2D', fontWeight: 100 }
            }) {
              Image($r('app.media.icon'))
                .width(24)
                .height(24)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0300')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: '800' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0400')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 200 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0500')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 900 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0600')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       fontWeight: FontWeight.Bolder}
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0700')
            .width(100).height(50)
          
            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 1000 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0800')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: null }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_0900')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: undefined}
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1000')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: -1 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1100')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: '' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1200')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 'adf@$5' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1300')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 500 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1400')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: undefined }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1500')
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 600 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_FontWeight_1600')
            .width(100).height(50)
            .layoutWeight(null)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red ,borderColor: 0x00ff00 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0100').height(20)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: '#fffd0000' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0200').height(20)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: 'rgb(138,43,226)' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0300').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: Color.Pink }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0400').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: $r('app.color.badge_BorderColor') }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0500').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: '' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0600').height(20)
            .backgroundColor($r('sys.color.ohos_id_color_badge_red'))
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: null }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0700').height(20)
            .backgroundColor($r('sys.color.ohos_id_color_badge_red'))
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: undefined }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0800').height(20)
            .backgroundColor($r('sys.color.ohos_id_color_badge_red'))
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, 
                       borderColor: Color.Pink}
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_0900').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: undefined }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .backgroundColor($r('sys.color.ohos_id_color_badge_red'))
            .key('ArkUX_Stage_Badge_BorderColor_1000').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: 'bgr(138,43,226)' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .backgroundColor($r('sys.color.ohos_id_color_badge_red'))
            .key('ArkUX_Stage_Badge_BorderColor_1100').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: 0x00ff00 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderColor_1200')
            .height(20)
            .backgroundColor(null)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: 5 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0100').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: '5px' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0200').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, 
                       borderWidth: $r('app.string.badge_Size_test') }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0300').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: '' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0400').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: null }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0500').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: undefined }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0600').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, 
                       borderWidth: '7fp' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0700').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, 
                       borderWidth: undefined }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0800').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: 'asdf%^7' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_0900').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: '5lpx' }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_1000')
            .height(20)
            .width(7)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red , borderWidth: 0 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_1100').height(20)
            .margin({
              top: 10
            })

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red , 
                       borderWidth: 5 ,borderColor: '#FFFD0000', fontWeight: 600 }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_1200').height(20)
            .margin({
              top: 10
            })
            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            }) {
              Button('test')
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(0x317aff)
            }
            .key('ArkUX_Stage_Badge_BorderWidth_1300').height(20)
            .backgroundColor($r('sys.color.ohos_id_color_badge_red'))
            .margin({
              top: 10
            })
      }
      .width('100%')
    }
    .height('100%')
  }
}
