'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Button, Text, Image,
  Menu, MenuItem, Builder, LocalizedAlignment, $r } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import uiEffect from '@ohos.graphics.uiEffect';

@Entry
@Component
struct CommonMethodIndex {
  @Builder
  commonMenuBuilder() {
    Menu() {
      MenuItem({ content: 'common_menu_item' });
    }
  }

  @State widthStatus: string = 'init';
  @State heightStatus: string = 'init';
  @State ignoreLayoutSafeAreaStatus: string = 'init';
  @State responseRegionListStatus: string = 'init';
  @State backgroundColorStatus: string = 'init';
  @State materialFilterStatus: string = 'init';
  @State transform3DStatus: string = 'init';
  @State layoutGravityStatus: string = 'init';
  @State bindContextMenuWithResponseStatus: string = 'init';
  @State accessibilityStateDescriptionStatus: string = 'init';
  @State accessibilityActionOptionsStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('CommonMethodIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('responseRegionList')
        .id('commonMethodResponseRegionListBtn')
        .key('commonMethodResponseRegionListBtnKey')
        .height('8%')
        .responseRegion([{
          x: '0vp',
          y: '0vp',
          width: '100%',
          height: '100%'
        }])

      Button('backgroundColor')
        .id('commonMethodBackgroundColorBtn')
        .key('commonMethodBackgroundColorBtnKey')
        .height('8%')
        .backgroundColor('#ff0000')

      Column()
        .width('50%')
        .height('5%')
        .backgroundColor('#ffffffff')
        .materialFilter(uiEffect.createFilter().blur(10))
        .id('materialId')

      Image($r('app.media.icon')).id('commonMethodTransform3DBtn').key('commonMethodTransform3DBtnKey')
        .width('5%')
        .height('5%')
        .transform3D(undefined)

      Text('layoutGravity').id('commonMethodLayoutGravityBtn').key('commonMethodLayoutGravityBtnKey')
        .height('5%')
        .layoutGravity(LocalizedAlignment.TOP_START)

      Text('bindContextMenuWithResponse').id('commonMethodBindContextMenuWithResponseBtn')
        .key('commonMethodBindContextMenuWithResponseBtnKey')
        .height('5%')
        .bindContextMenuWithResponse(this.commonMenuBuilder)

      Text('accessibilityStateDescription').id('commonMethodAccessibilityStateDescriptionBtn')
        .key('commonMethodAccessibilityStateDescriptionBtnKey')
        .height('5%')
        .accessibilityStateDescription('state_desc')

      Text('accessibilityActionOptions').id('commonMethodAccessibilityActionOptionsBtn')
        .key('commonMethodAccessibilityActionOptionsBtnKey')
        .height('5%')
        .accessibilityActionOptions(undefined)

    }
    .width('100%')
    .height('100%');
  }
}
