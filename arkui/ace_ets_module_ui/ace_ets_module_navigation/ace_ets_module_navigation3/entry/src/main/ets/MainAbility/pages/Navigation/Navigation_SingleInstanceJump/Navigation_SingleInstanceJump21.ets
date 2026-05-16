/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct Navigation_SingleInstanceJump21{
  pathInfos:NavPathStack  = new NavPathStack()
  @State count:number = 1
  @State text:string = ''


  update():void{
    let name:string[] = this.pathInfos.getAllPathName()
    for (let i = 0; i < name.length; i++) {
      if (!this.pathInfos.getParamByIndex(i)) {
        this.text += ` ${name[i]},Param:undefined`
      }else{
        this.text += `${name[i]},Param:${JSON.stringify(this.pathInfos.getParamByIndex(i))} `
      }
    }
  }


  @Builder Page1(){
    NavDestination(){
      Column(){
        Text('page1')
      }
    }
    .title('page1')

  }
  @Builder Page2(){
    NavDestination(){
      Column(){
        Text('page1')
      }
    }.title('page1')
  }

  @Builder PageMap(name:string){
    if (name == 'page1'){
      this.Page1()
    }else if (name == 'page2'){
      this.Page2()
    }
  }
  build() {
    Column(){
      Navigation(this.pathInfos){


      }
      .title('navigation',{
        barStyle:BarStyle.STACK
      })
      .height(300)
      .navDestination(this.PageMap)

      Button('pushDestination page1').onClick((event: ClickEvent) => {
        this.pathInfos.pushDestination({name:'page1',param: this.count++},{launchMode:LaunchMode.STANDARD})
      }).id('Navigation_SingleInstanceJump21_btn1')
      Button('pushDestination page2').onClick((event: ClickEvent) => {
        this.pathInfos.pushDestination({name:'page2',param: this.count++},{launchMode:LaunchMode.STANDARD})
      }).id('Navigation_SingleInstanceJump21_btn2')
      Text(this.text).id('Navigation_SingleInstanceJump21_text1')
      Button('getAll').onClick(() => {
        this.text = ''
        this.update()
      }).id('Navigation_SingleInstanceJump21_btn3')

    }
  }
}