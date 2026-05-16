'use static'
/*
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

/**
 * Common LayoutGravity Test Page
 * 测试 common 模块的 layoutGravity 属性
 */
import { Entry, Text, Column, Component, Stack, Button, Image, LocalizedAlignment,Alignment,Color,$r } from '@kit.ArkUI';

@Entry
@Component
struct CommonLayoutGravity {
  build() {
    Column() {
      Text('Common LayoutGravity Test')
        .height('5%')

      // 调用覆盖白名单测试 - Text 组件
      Text('Invoke - Text')
        .id('text_invoke_text')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(39, 135, 217)')
          .id('stack_invoke_text')
          .layoutGravity(LocalizedAlignment.CENTER)
      }
        .width(10)
        .height(10)
        .backgroundColor(Color.Grey)

      // 调用覆盖白名单测试 - Button 组件
      Text('Invoke - Button')
        .id('text_invoke_button')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Button('Button')
          .width(10)
          .height(5)
          .id('stack_invoke_button')
          .layoutGravity(LocalizedAlignment.CENTER)
      }
        .width(10)
        .height(10)
        .backgroundColor(Color.Grey)

      // 调用覆盖白名单测试 - Image 组件
      Text('Invoke - Image')
        .id('text_invoke_image')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Image($r('app.media.icon'))
          .width(10)
          .height(10)
          .id('stack_invoke_image')
          .layoutGravity(LocalizedAlignment.CENTER)
      }
        .width(10)
        .height(10)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.CENTER
      Text('Args - CENTER (default)')
        .id('text_args_center')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(50, 150, 50)')
          .id('stack_args_center')
          .layoutGravity(LocalizedAlignment.CENTER)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.TOP_START
      Text('Args - TOP_START')
        .id('text_args_top_start')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(150, 50, 50)')
          .id('stack_args_top_start')
          .layoutGravity(LocalizedAlignment.TOP_START)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.TOP
      Text('Args - TOP')
        .id('text_args_top')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(200, 100, 50)')
          .id('stack_args_top')
          .layoutGravity(LocalizedAlignment.TOP)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.TOP_END
      Text('Args - TOP_END')
        .id('text_args_top_end')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(200, 150, 50)')
          .id('stack_args_top_end')
          .layoutGravity(LocalizedAlignment.TOP_END)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.START
      Text('Args - START')
        .id('text_args_start')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(50, 50, 200)')
          .id('stack_args_start')
          .layoutGravity(LocalizedAlignment.START)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.END
      Text('Args - END')
        .id('text_args_end')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(200, 50, 50)')
          .id('stack_args_end')
          .layoutGravity(LocalizedAlignment.END)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.BOTTOM_START
      Text('Args - BOTTOM_START')
        .id('text_args_bottom_start')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(50, 200, 150)')
          .id('stack_args_bottom_start')
          .layoutGravity(LocalizedAlignment.BOTTOM_START)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.BOTTOM
      Text('Args - BOTTOM')
        .id('text_args_bottom')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(150, 200, 50)')
          .id('stack_args_bottom')
          .layoutGravity(LocalizedAlignment.BOTTOM)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 入参覆盖白名单测试 - LocalizedAlignment.BOTTOM_END
      Text('Args - BOTTOM_END')
        .id('text_args_bottom_end')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(200, 200, 50)')
          .id('stack_args_bottom_end')
          .layoutGravity(LocalizedAlignment.BOTTOM_END)
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)

      // 参数规格覆盖白名单测试 - undefined (无效输入)
      Text('Args Spec - undefined (invalid, defaults to CENTER)')
        .id('text_args_spec_undefined')
        .height('5%')

      Stack({
        alignContent: Alignment.End
      }) {
        Text('Child')
          .width(10)
          .height(10)
          .backgroundColor('rgb(100, 100, 100)')
          .id('stack_args_spec_undefined')
      }
        .width(15)
        .height(15)
        .backgroundColor(Color.Grey)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}