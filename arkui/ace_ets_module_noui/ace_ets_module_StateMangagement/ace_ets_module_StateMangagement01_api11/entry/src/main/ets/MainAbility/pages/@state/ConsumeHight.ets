/**
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
import CommonFunc from '../../../MainAbility/common/Common';

@Component
struct Child_CH {
  // @Consume装饰的变量通过相同的属性名绑定其祖先组件Ancestors内的@Provide装饰的变量
  @Consume hight: ResourceStr | Length;

  build() {
    Column() {
      Text("设置变量number类型10-->7").height('3%')
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = 7
        })
        .key('ConsumeHeight1')


      Text("设置变量string类型10-->'8'").height('3%')
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = '8'
        })
        .key('ConsumeHeight2')

      Text("设置变量Resource类型10-->Resource").height('3%')
      Button('change')
        .height(this.hight)
        .onClick(() => {
          this.hight = $r('app.string.number_9')
          console.info("hk____" + this.hight)
        })
        .key('ConsumeHeight3')

    }
  }
}


@Entry
@Component
struct Ancestors_CH {
  // @Provide装饰的联合类型count由入口组件Ancestors提供其后代组件
  @Provide hight: ResourceStr | Length = 10;

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.hight)) + " number is " + JSON.stringify(this.hight))
        .fontSize(9).key('ConsumeHight').height('3%')

      Child_CH()


    }.width('100%')
  }
}