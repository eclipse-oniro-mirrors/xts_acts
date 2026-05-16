'use static'

import { CustomTransition, AnimateCallback } from './CustomNavigationUtils'
import {
  NavigationAnimatedTransition,
  ButtonType,
  NavContentInfo,
  NavigationOperation,
  Navigation,
  NavPathStack,
  NavPathInfo,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  AttributeModifier,
  NavigationAttribute,
  Entry,
  NavDestination,
  ColumnOptions
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyNavigationModifier implements AttributeModifier<NavigationAttribute> {
  public isUndefined: boolean = false;
  public changeCount: number = 0;

  applyNormalAttribute(instance: NavigationAttribute): void {
    instance.customNavContentTransition(this.isUndefined ? undefined :
      (from: NavContentInfo, to: NavContentInfo, operation: NavigationOperation):
      NavigationAnimatedTransition | undefined => {
        this.changeCount = to.index
        // 返回 undefined 表示使用默认转场动效
        return undefined
      })
  }
}

@Entry
@Component
struct NavigationExample {
  pageInfos: NavPathStack = new NavPathStack();
  @State modifier: MyNavigationModifier = new MyNavigationModifier();
  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Text('pageOne2')
          .id('NavPathStackApi2_text_pageOne')
          .onClick(() => {
            this.pageInfos.pop()
          })
      }.width('100%').height('100%')
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column() {
      Text(this.modifier.changeCount.toString()).id('changeCountTextModifier')

      Navigation(this.pageInfos) {
        Text('this navigation bar')

        Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule })
          .id('pushButton')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            //将name指定的NavDestination页面信息入栈，传递的数据为param
            this.pageInfos.pushDestinationByName('pageOne', CustomTransition.getInstance().getAnimationId());
          })
      }
      .title('NavIndex')
      .attributeModifier(this.modifier)
      .navDestination(this.PageMap)
      .height('50%')

      Button('customNavContentTransition:' + this.modifier.changeCount + ' ' + this.modifier.isUndefined)
        .id('toggleButton')
        .onClick((e: ClickEvent) => {
          // 创建新的 Modifier 实例以触发重新应用
          this.modifier.isUndefined = !this.modifier.isUndefined
        })
    }
  }
}
