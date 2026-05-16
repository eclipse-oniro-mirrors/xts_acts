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
import { uiObserver } from '@kit.ArkUI';

import { curves } from '@kit.ArkUI';
let interpolate1 = (fraction:number):number => {
  fraction = 0
  console.log('curves001 return is : ' + Math.sqrt(fraction))
  return Math.sqrt(fraction)
}
let interpolate2 = (fraction:number):number => {
  fraction = 0.5
  console.log('curves001 return is : ' + Math.sqrt(fraction))
  return Math.sqrt(fraction)
}
let interpolate3 = (fraction:number):number => {
  fraction = 5
  console.log('curves001 return is : ' + Math.sqrt(fraction))
  return Math.sqrt(fraction)
}
let interpolate4 = (fraction:number):number => {
  fraction = -0.5
  console.log('curves001 return is : ' + Math.sqrt(fraction))
  return Math.sqrt(fraction)
}
let interpolate5 = (fraction:number):number => {
  fraction = 1
  console.log('curves001 return is : ' + Math.sqrt(fraction))
  return Math.sqrt(fraction)
}
export interface TestAttributes {
  curves?: number | Curve | ICurve | undefined | null;
}

export const testData: TestAttributes[] = [
  {
    curves: curves.initCurve(Curve.Linear)
  },
  {
    curves:undefined
  },
  {
    curves: curves.initCurve(Curve.Ease)
  },
  {
    curves:null
  },
  {
    curves: curves.initCurve(Curve.EaseIn)
  },
  {
    curves: curves.initCurve()
  },
  {
    curves: curves.initCurve(Curve.EaseOut)
  },
  {
    curves: curves.initCurve(Curve.EaseInOut)
  },
  {
    curves: curves.initCurve(undefined)
  },
  {
    curves: curves.initCurve(Curve.FastOutSlowIn)
  },
  {
    curves: curves.initCurve(Curve.LinearOutSlowIn)
  },
  {
    curves: curves.initCurve(Curve.FastOutLinearIn)
  },
  {
    curves: curves.initCurve(Curve.ExtremeDeceleration)
  },
  {
    curves: curves.initCurve(Curve.Sharp)
  },
  {
    curves: curves.initCurve(Curve.Rhythm)
  },
  {
    curves: curves.initCurve(Curve.Smooth)
  },
  {
    curves: curves.initCurve(Curve.Friction)
  },
  {
    curves: curves.stepsCurve(9, true)
  },
  {
    curves: curves.stepsCurve(0, true)
  },
  {
    curves: curves.stepsCurve(0, false)
  },
  {
    curves: curves.stepsCurve(0, false)
  },
  {
    curves: curves.cubicBezierCurve(0.1, 0.0, 0.1, 1.0)
  },
  {
    curves: curves.springCurve(0, 1, 228, 30)
  },
  {
    curves: curves.springMotion(0.5, 0.6, 0)
  },
  {
    curves: curves.responsiveSpringMotion(0.5, 0.6, 0)
  },
  {
    curves: curves.interpolatingSpring(0, 1, 228, 30)
  },
  {
    curves: curves.customCurve(interpolate5)
  },
]
interface itemType {
  text: string
}

@Entry
@Component
struct TabsAnimationExample {
  changeCallbackFunc(info: uiObserver.TabContentInfo) {
    console.info('tabChange', JSON.stringify(info));
    AppStorage.setOrCreate('Index', JSON.stringify(info.index))
    AppStorage.setOrCreate('tabContentId', JSON.stringify(info.tabContentId))
    AppStorage.setOrCreate('tabContentUniqueId', JSON.stringify(info.tabContentUniqueId))
    AppStorage.setOrCreate('state', JSON.stringify(info.state))
    AppStorage.setOrCreate('id', JSON.stringify(info.id))
    AppStorage.setOrCreate('uniqueId', JSON.stringify(info.uniqueId))
    AppStorage.setOrCreate('lastIndex', JSON.stringify(info.lastIndex))
  }
  aboutToAppear(): void {
    let observer = this.getUIContext().getUIObserver();
    observer.on('tabChange',{ id: 'tab1' },this.changeCallbackFunc);
  }
  @State data: itemType[] = [
    {
      text: 'Red'
    },
    {
      text: 'Yellow'
    },
    {
      text: 'Blue'
    }]
  @State data1: itemType[] = [
    {
      text: 'Black'
    },
    {
      text: 'Blue'
    },
    {
      text: 'Green'

    },
    {
      text: 'Orange'
    }]
  @State opacityList: number[] = [];
  @State scaleList: number[] = [];
  @State testData: TestAttributes[] = testData;
  @State currentIndex: number = 0;
  @State currentIndexOri: number = 0;
  private controller: TabsController = new TabsController();
  private controller1: TabsController = new TabsController();
  @State textIndex:string = '111';
  @State textTabContentId:string = '111';
  @State textTabContentUniqueId:string = '111';
  @State textState:string = '111';
  @State textId:string = '111';
  @State textUniqueId:string = '111';
  @State textLastIndex:string = '111';
  build() {
    Column() {
      Row(){
        Text(this.textIndex)
          .id('textIndex')
        Text(this.textTabContentId)
          .id('textTabContentId')
        Text(this.textTabContentUniqueId)
          .id('textTabContentUniqueId')
        Text(this.textState)
          .id('textState')
        Text(this.textId)
          .id('textId')
        Text(this.textUniqueId)
          .id('textUniqueId')
        Text(this.textLastIndex)
          .id('textLastIndex')
      }
      Row() {
        Button('get')
          .id('idGet')
          .onClick(() => {
            this.textIndex = (AppStorage.get('Index') as string) + '';
            this.textTabContentId = (AppStorage.get('tabContentId') as string) + '';
            this.textTabContentUniqueId = (AppStorage.get('tabContentUniqueId') as string) + '';
            this.textState = (AppStorage.get('state') as string) + '';
            this.textId = (AppStorage.get('id') as string) + '';
            this.textUniqueId = (AppStorage.get('uniqueId') as string) + '';
            this.textLastIndex = (AppStorage.get('lastIndex') as string) + '';
          })
        Button('off1')
          .id('idOff')
          .onClick(() => {
            let observer = this.getUIContext().getUIObserver();
            observer.off('tabChange', { id: 'tab1' }, this.changeCallbackFunc);
          })
        Button('on2')
          .id('idOn2')
          .onClick(() => {
            let observer = this.getUIContext().getUIObserver();
            observer.on('tabChange', { id: 'tab2' }, this.changeCallbackFunc);
          })
        Button('增')
          .id('add1')
          .onClick(() => {
            this.changeIndex1(this.currentIndexOri + 1)
          })
      }
      Row({ space: 5 }) {
        Text('changeIndex:' + this.currentIndex)
        Button('加')
          .id('add')
          .onClick(() => {
            this.changeIndex(this.currentIndex + 1)
          })
        Button('减')
          .id('reduce')
          .onClick(() => {
            this.changeIndex(this.currentIndex - 1)
          })
      }

      Tabs({ controller: this.controller }) {
        ForEach(this.data1, (item: itemType, index: number) => {
          TabContent() {
          }
          .tabBar(item.text)
        })
      }
      .height('10%')
      .id('tab1')
      .width('50%')
      Tabs({ controller: this.controller1 }) {
        ForEach(this.data, (item: itemType, index: number) => {
          TabContent() {
          }
          .tabBar(item.text)
        })
      }
      .id('tab2')
      .backgroundColor(0xf1f3f5)
      .width('50%')
      .height('10%')
      .vertical(true)
    }
  }

  private changeIndex(index: number) {
    console.log('changeIndex enter|index:' + index);
    if (index < 0) {
      index = 0;
    }
    index = index % this.data1.length;
    console.log('changeIndex debug|index:' + index + ', length' + this.data1.length);
    this.controller.changeIndex(index);
    this.currentIndex = index;
    console.log('changeIndex leave|currentIndex:' + index);
  }
  private changeIndex1(index: number) {
    console.log('changeIndex enter|index:' + index);
    if (index < 0) {
      index = 0;
    }
    index = index % this.data.length;
    console.log('changeIndex debug|index:' + index + ', length' + this.data1.length);
    this.controller1.changeIndex(index);
    this.currentIndexOri = index;
    console.log('changeIndex leave|currentIndex:' + index);
  }
}