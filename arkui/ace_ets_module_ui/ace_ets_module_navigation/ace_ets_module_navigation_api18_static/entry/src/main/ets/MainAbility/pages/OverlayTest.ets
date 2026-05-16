'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,Component,$r,Scroll,Builder,List,Search,Axis,NavPathInfo,
  Column,Navigation,Stack,Text,Color,Flex,ItemAlign,Button,ClickEvent,
  Axis,Margin,ForEach,NavPathStack,wrapBuilder} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume,StorageLink
} from '@ohos.arkui.stateManagement';
import { ComponentContent } from '@ohos.arkui.node';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { CommonNavigation } from './CommonNavigation';


@Component
struct OverlayComponent {
  build() {
    Column() {
      Button('关闭Overlay').onClick((e:ClickEvent) => {
        this.getUIContext().getOverlayManager().hideAllComponentContents()
      }).id('closeOverLayId')
    }.backgroundColor(Color.White)
  }
}

@Builder
function overlayBuilder() {
  OverlayComponent()
}

@Entry
@Component
struct OverlayTest {
  pathStack: NavPathStack = new NavPathStack();
  // @Provide({ allowOverride: 'pathStack' }) pathStack: NavPathStack = new NavPathStack();
  builderComponent:ComponentContent<never> = new ComponentContent<never>(this.getUIContext(), wrapBuilder(overlayBuilder))
  clickItems: Array<ClickItem> = [{
    name: 'push pageOne',
    callback: () => {
      console.log("============================= ")
      this.pathStack.pushDestination(new NavPathInfo( 'pageOne', new Object())).then(() => {
        console.log('testOnActive pageOne success');
      }).catch((err: Error) => {
        console.log(`testOnActive pageOne failed: ${err.code}, message: ${err.message}`);
      })
    },
    id: 'overLayPushId'
  } as ClickItem, {
    name: '开启Overlay',
    callback: () => {
      this.getUIContext().getOverlayManager().addComponentContent(this.builderComponent)
      this.getUIContext().getOverlayManager().showComponentContent(this.builderComponent)
    },
    id: 'openOverLayId'
  } as ClickItem
  ]

  build() {
    Column() {
      ForEach(this.clickItems, (item: ClickItem) => {
        Button(item.name).width(300).height(30).onClick(item.callback).margin(10).id(item.id)
      })
       CommonNavigation({pathStack: this.pathStack, title: 'Overlay Page Navigation'})
    }
  }
}

export interface ClickItem {
  name: string;
  callback: () => void;
  id?: string;
}