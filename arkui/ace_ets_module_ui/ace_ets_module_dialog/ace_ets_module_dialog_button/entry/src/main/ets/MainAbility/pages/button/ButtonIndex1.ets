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

@Entry
@Component
struct Index {
  @State textvalue: string[] = ['我是谁', 'who am I', '!@#$%', '123456', '哈ji*0.',
    'hello hellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello']
  @State textAlignIndex: number = 0
  @State textValueIndex: number = 0
  @State aaa: TextAlign = TextAlign.Start
  build() {
    Scroll() {
      Column() {
        //动态切
        Column() {
          Row() {
            Button('change_vale')
              .onClick(() => {
                this.textValueIndex++
                if (this.textValueIndex > this.textvalue.length - 1) {
                  this.textValueIndex = 0
                }
              })
              .width('30%')
            Button('modifier').backgroundColor('#FFFF00FF')
              .onClick((e: ClickEvent) => {
                this.getUIContext().getRouter().pushUrl({ url: 'MainAbility/pages/button/modifier', })
              })
              .width('30%')
          }.height('5%')

          Row(){
            Button('start')
              .onClick(() => {

              })
            Button('center')
              .onClick(() => {
                this.aaa = TextAlign.Center;
              })
            Button('end')
              .onClick(() => {
                this.aaa = TextAlign.End;
              })
            Button('justify')
              .onClick(() => {
                this.aaa = TextAlign.JUSTIFY;
              })
            Button('left')
              .onClick(() => {
                this.aaa = TextAlign.LEFT;
              })
            Button('right')
              .onClick(() => {
                this.aaa = TextAlign.RIGHT;
              })
          }

          Button(this.textvalue[5])
            .labelStyle({textAlign:this.aaa})
            .key('textValue')
        }

        Row() {
          //正常——Start
          Column() {
            Text('正常——start')
              .height('5%')
            Button('哈ji*0.')
              .labelStyle({
                textAlign: TextAlign.Start
              })
              .backgroundColor(Color.Red)
              .key('short1')
              .height('5%')
            Button() {
              Text('哈ji*0.')
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .backgroundColor(Color.Blue)
            .labelStyle({
              textAlign: TextAlign.Center
            })
            .key('short2')
            .height('5%')
          }
          .width('40%')

          //正常——Center
          Column() {
            Text('正常——Center')
              .height('5%')
            Button('哈ji*0.')
              .labelStyle({
                textAlign: TextAlign.Center
              })
              .backgroundColor(Color.Red)
              .height('5%')
            Button() {
              Text('哈ji*0.')
                .textAlign(TextAlign.Center)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }.backgroundColor(Color.Blue).height('5%')
          }
          .width('40%')
        }

        Row() {
          Column() {
            Text('正常——End')
              .height('5%')
            Button('哈ji*0.')
              .labelStyle({
                textAlign: TextAlign.End
              })
              .backgroundColor(Color.Red)
              .key('short3')
              .height('5%')
            Button() {
              Text('哈ji*0.')
                .textAlign(TextAlign.Center)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .backgroundColor(Color.Blue)
            .labelStyle({
              textAlign: TextAlign.End
            })
            .key('short4')
            .height('5%')
          }.width('40%')

          //正常——JUSTIFY
          Column() {
            Text('正常——JUSTIFY')
              .height('5%')
            Button('哈ji*0.')
              .labelStyle({
                textAlign: TextAlign.JUSTIFY
              })
              .backgroundColor(Color.Red)
              .key('short5')
              .height('5%')
            Button() {
              Text('哈ji*0.')
                .textAlign(TextAlign.JUSTIFY)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .backgroundColor(Color.Blue)
            .labelStyle({
              textAlign: TextAlign.JUSTIFY
            })
            .key('short6')
            .height('5%')
          }
          .width('40%')
        }

        Row() {
          //正常——LEFT
          Column() {
            Text('正常——LEFT')
              .height('5%')
            Button('哈ji*0.')
              .labelStyle({
                textAlign: TextAlign.LEFT
              })
              .backgroundColor(Color.Red)
              .key('left')
              .height('5%')
            Button() {
              Text('哈ji*0.')
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .backgroundColor(Color.Blue)
            .labelStyle({
              textAlign: TextAlign.LEFT
            })
            .key('left1')
            .height('5%')
          }.width('40%')

          //正常——RIGHT
          Column() {
            Text('正常——RIGHT')
              .height('5%')
            Button('哈ji*0.')
              .labelStyle({
                textAlign: TextAlign.RIGHT
              })
              .backgroundColor(Color.Red)
              .key('right')
              .height('5%')
            Button() {
              Text('哈ji*0.')
                .textAlign(TextAlign.End)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .backgroundColor(Color.Blue)
            .labelStyle({
              textAlign: TextAlign.RIGHT
            })
            .key('right1')
            .height('5%')
          }.width('40%')
        }


        //超长——start
        Column() {
          Text('超长——start')
            .height('5%')
          Button('hello#5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
            .labelStyle({
              maxLines: 2,
              textAlign: TextAlign.Start
            })
            .key('longline1')
            .height('5%')
        }

        //超长——Center
        Column() {
          Text('超长——Center')
            .height('5%')
          Button('hello#5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
            .labelStyle({
              maxLines: 3,
              textAlign: TextAlign.Center
            })
            .key('longline2')
            .height('5%')
        }

        //超长——End
        Column() {
          Text('超长——End')
            .height('5%')
          Button('hello#5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
          //.width(200)
            .labelStyle({
              maxLines: 3,
              textAlign: TextAlign.End
            })
            .key('longline3')
            .height('5%')
          Button() {
            Text('hello 5463456 hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .labelStyle({
            maxLines: 3,
            textAlign: TextAlign.End
          })
          .key('longline4')
          .height('5%')
        }

        //超长——JUSTIFY
        Column() {
          Text('超长——JUSTIFY')
            .height('5%')
          Button('hello#5463456&hello hello world imfine thankyou and you how are you longlongago veryverynice goodgoodstudy hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello ')
            .labelStyle({
              maxLines: 3,
              textAlign: TextAlign.JUSTIFY
            })
            .key('longline5')
            .height('5%')
          Button() {
            Text('hello 5463456 hello hellohello &*……%……&￥）（ hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .textAlign(TextAlign.Center)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .labelStyle({
            maxLines: 3,
            textAlign: TextAlign.JUSTIFY
          })
          .key('longline6')
          .height('5%')
        }

        //超长——LEFT
        Column() {
          Text('超长——LEFT')
          Button('hello#5463456&hello hello world imfine thankyou and you how are you longlongago veryverynice goodgoodstudy hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello ')
            .labelStyle({
              maxLines: 3,
              textAlign: TextAlign.LEFT
            })
            .key('longlineleft')
            .height('5%')
          Button() {
            Text('hello 5463456 hello hellohello &*……%……&￥）（ hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .textAlign(TextAlign.Start)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .labelStyle({
            maxLines: 3,
            textAlign: TextAlign.LEFT
          })
          .key('longlineleft1')
          .height('5%')
        }

        //超长——RIGHT
        Column() {
          Text('超长——RIGHT')
            .height('5%')
          Button('hello#5463456&hello hello world imfine thankyou and you how are you longlongago veryverynice goodgoodstudy hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello ')
            .labelStyle({
              maxLines: 3,
              textAlign: TextAlign.RIGHT
            })
            .key('longlineright')
            .height('5%')
          Button() {
            Text('hello 5463456 hello hellohello &*……%……&￥）（ hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .textAlign(TextAlign.End)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .labelStyle({
            maxLines: 3,
            textAlign: TextAlign.RIGHT
          })
          .key('longlineright1')
          .height('5%')
        }

        Row() {
          Column() {
            Text('超长——start')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .labelStyle({
                textAlign: TextAlign.Start
              })
              .key('long1')
            Button() {
              Text('hello T5463456& hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
                .textAlign(TextAlign.Center)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .labelStyle({
              textAlign: TextAlign.Start
            })
            .key('long2')
          }.width('40%')

          //超长——Center
          Column() {
            Text('超长——Center')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .labelStyle({
                textAlign: TextAlign.Center
              })
              .key('long3')
            Button() {
              Text('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .key('long4')
            .labelStyle({
              textAlign: TextAlign.Center
            })
          }.width('40%')
        }

        Row() {
          Column() {
            Text('超长——End')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .labelStyle({
                textAlign: TextAlign.End
              })
              .key('long5')
            Button() {
              Text('hello 5463456 hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
                .textAlign(TextAlign.Center)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .labelStyle({
              textAlign: TextAlign.End
            })
            .key('long6')
          }.width('40%')

          //超长——JUSTIFY
          Column() {
            Text('超长——JUSTIFY')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .labelStyle({
                textAlign: TextAlign.JUSTIFY
              })
              .key('long7')
            Button() {
              Text('hello 5463456 hello hellohello &*……%……&￥）（ hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
                .textAlign(TextAlign.Center)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .labelStyle({
              textAlign: TextAlign.JUSTIFY
            })
            .key('long8')
          }.width('40%')
        }

        Row() {
          Column() {
            Text('超长——LEFT')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .labelStyle({
                textAlign: TextAlign.LEFT
              })
              .key('longleft')
            Button() {
              Text('hello 5463456 hello hellohello &*……%……&￥）（ hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .labelStyle({
              textAlign: TextAlign.LEFT
            })
            .key('longleft1')
          }.width('40%')

          Column() {
            Text('超长——RIGHT')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .labelStyle({
                textAlign: TextAlign.RIGHT
              })
              .key('longright')
            Button() {
              Text('hello 5463456 hello hellohello &*……%……&￥）（ hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
                .textAlign(TextAlign.End)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .labelStyle({
              textAlign: TextAlign.RIGHT
            })
            .key('longright1')
          }.width('40%')

          Column() {
            Text('超长—undefined')
            Button('helloT5463456&hello hellohello &*……%……&￥hellohello 供热阿噗客人 《》？》 lohellohellohellohellohellohello')
              .width(100)
              .labelStyle({
                textAlign: undefined
              })
              .key('undefined')
          }.width('40%')
        }

      }
    }
    .height('100%')
  }
}
